class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9028a42a145683fb913b4d69f8bd295f86e49fa3233f872c54c3b64d1908e113"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent v#{version}", shell_output("#{bin}/ardent --version").chomp
  end
end
