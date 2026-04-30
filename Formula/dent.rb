class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/node-dent-cli"
  url "https://github.com/idleberg/node-dent-cli/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "35db353e85a29c7aeb40dcc6b535643f78b9006ca467a45b6682223f2c74de02"
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
