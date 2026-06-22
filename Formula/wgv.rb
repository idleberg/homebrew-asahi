class Wgv < Formula
  desc "Cross-platform winget manifest validator"
  homepage "https://github.com/idleberg/wgv"
  url "https://github.com/idleberg/wgv/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "874ac312aeafc9a6d6d45bc8ba5a46ea1f0735bb9db0abe51a416c91e56777ed"
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
