class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/node-dent-cli"
  url "https://github.com/idleberg/node-dent-cli/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "0ff4434ef6c4064b79a497dcd6cdff19a556c422ac35fe8645231b1df2396140"
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
