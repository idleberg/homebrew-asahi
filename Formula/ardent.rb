class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.9.5.tar.gz"
  sha256 "d5d4ea4fc9863d48b43268c9d115812bbed0f45224c72828500aa4eb43adf51b"
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
