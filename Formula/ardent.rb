class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://idleberg.github.io/ardent/"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.16.0.tar.gz"
  sha256 "2e78b74782e2170ecfe03c705224e7e64e635a96b84f180e07ee2fbeeb30b12d"
  license "MIT"
  head "https://github.com/idleberg/ardent.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"ardent", "completions")
  end

  test do
    assert_equal "ardent #{version}", shell_output("#{bin}/ardent --version").chomp

    (testpath/"test.nsi").write "section\nNOP\nsectionend"
    assert_equal "Section\n\tNop\nSectionEnd\n", shell_output("#{bin}/ardent format #{testpath}/test.nsi")
  end
end
