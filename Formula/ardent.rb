class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "58f086b02ffc3ddcd35bbda1db6208967f6fe89e1bf9e540c605abdee9c1aa10"
  license "MIT"
  head "https://github.com/idleberg/ardent.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent v#{version}", shell_output("#{bin}/ardent --version").chomp
  end
end
