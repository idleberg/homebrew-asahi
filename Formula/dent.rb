class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/node-dent-cli"
  url "https://github.com/idleberg/node-dent-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ea5607f02c436c12a9079272ea8e5e54a6907cc7bcc4c0952f179f5fbf40bac4"
  license "MIT"
  head "https://github.com/idleberg/node-dent-cli.git", branch: "main"

  depends_on "deno" => :build

  def install
    system "deno", "install"
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    target = OS.mac? ? "#{arch}-apple-darwin" : "#{arch}-unknown-linux-gnu"
    system "deno", "compile", "--allow-all", "--target=#{target}", "--output=dent", "src/main.ts"
    bin.install "dent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dent --version")
  end
end
