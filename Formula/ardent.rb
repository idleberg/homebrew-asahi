class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "71e53eaa8c9ccf896bf267c7ab03bb16f3b4ac047c299811f82cfdf4b002995"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent v#{version}", shell_output("#{bin}/ardent --version").chomp
  end
end
