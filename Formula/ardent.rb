class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://idleberg.github.io/ardent/"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "7036d1becb0a92567b72ca8f1c6e376275168da4e06c30d95bd4293a41360eb4"
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
