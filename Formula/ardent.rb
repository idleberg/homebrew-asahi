class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://idleberg.github.io/ardent/"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "f20f20ac70b0d63aa7b88cac5e61c8e902ccf97b6cf06e28cb9a1e8cff800a34"
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
