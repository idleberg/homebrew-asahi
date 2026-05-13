class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/node-dent-cli"
  url "https://github.com/idleberg/node-dent-cli/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "e2649a3b1d1097bd5937fa957649e99262d925fedd6b5e81a1f3dedfefe95b2c"
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
