class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/node-dent-cli"
  url "https://github.com/idleberg/node-dent-cli/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "982f4187b74cbd4d83ef915774e0b35dc7fe3d484b8eef551039eb510de5118e"
  license "MIT"
  head "https://github.com/idleberg/node-dent-cli.git", branch: "main"

  depends_on "deno" => :build

  def install
    system "deno", "install"
    system "deno", "compile", "--allow-all", "--output=#{bin}/dent", "src/main.ts"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dent --version")
  end
end
