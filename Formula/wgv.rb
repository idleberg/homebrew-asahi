class Wgv < Formula
  desc "Cross-platform winget manifest validator"
  homepage "https://github.com/idleberg/wgv"
  url "https://github.com/idleberg/wgv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b0353aa59c1969b6d166cd60843e3b8014cf0314074b4dd485ba24023971a41f"
  license "MIT"
  head "https://github.com/idleberg/wgv.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"Test.Example.yaml").write <<~YAML
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
    assert_match "succeeded", shell_output("#{bin}/wgv #{testpath}/Test.Example.yaml")
  end
end
