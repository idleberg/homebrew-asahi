class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "9a1e68c51397b1d4c83e8bfa9fe8fbf1937a4aec840b55700959117206d30232"
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
