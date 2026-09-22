class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://idleberg.github.io/ardent/"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.14.2.tar.gz"
  sha256 "a65ae06cbc2c08696cfe51276346ed0b96f31f4c7159500d0a89f23f0f74d1f7"
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
