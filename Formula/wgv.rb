class Wgv < Formula
  desc "Cross-platform winget manifest validator"
  homepage "https://github.com/idleberg/wgv"
  url "https://github.com/ideberg/wgv/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d97671c65dda17a27d1de59359c36124249b2308cd22d26d9e159d1ab9e6f5a1"
  license "MIT"
  head "https://github.com/idleberg/wgv.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent #{version}", shell_output("#{bin}/wgv --version").chomp

    (testpath/"Test.Example.yaml").write <<~YAML
      # yaml-language-server: $schema=https://aka.ms/winget-manifest.singleton.1.10.0.schema.json
      PackageIdentifier: Test.Example
      PackageVersion: "1.0.0"
      PackageLocale: en-US
      Publisher: Test Publisher
      PackageName: Example
      License: MIT
      ShortDescription: A test package
      ManifestType: singleton
      ManifestVersion: 1.10.0
      Installers:
      - Architecture: x64
        InstallerType: exe
        InstallerUrl: https://example.com/installer.exe
        InstallerSha256: ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890
        InstallerSwitches:
          Silent: /S
          SilentWithProgress: /S
    YAML
    assert_match "succeeded", shell_output("#{bin}/wgv #{testpath}/Test.Example.yaml 2>&1")
  end
end
