class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://idleberg.github.io/ardent/"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.14.1.tar.gz"
  sha256 "4758e0aa2c9d9a8b0d7d27ccc7728014e5fdb1b5d3b6da9b07fc5b1110d9429f"
  license "MIT"
  head "https://github.com/idleberg/ardent.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent #{version}", shell_output("#{bin}/ardent --version").chomp

    (testpath/"test.nsi").write "section\nNOP\nsectionend"
    assert_equal "Section\n\tNop\nSectionEnd\n", shell_output("#{bin}/ardent format #{testpath}/test.nsi")
  end
end
