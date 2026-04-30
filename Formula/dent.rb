class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/node-dent-cli"
  url "https://github.com/idleberg/node-dent-cli/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "35db353e85a29c7aeb40dcc6b535643f78b9006ca467a45b6682223f2c74de02"
  license "MIT"
  head "https://github.com/idleberg/node-dent-cli.git", branch: "main"

  depends_on "bun" => :build

  def install
    system "bun", "install", "--frozen-lockfile"
    target = "bun-#{OS.kernel_name.downcase}-#{Hardware::CPU.arm? ? "arm64" : "x64"}-modern"
    system "bun", "build", "src/main.ts", "--compile", "--target=#{target}", "--outfile=dent"
    bin.install "dent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dent --version")
  end
end
