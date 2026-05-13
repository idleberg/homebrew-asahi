class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "59a7b1cf95d86bac6766605f90773499bcbc11da06d6451453b1c2ac9b6d505e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent v#{version}", shell_output("#{bin}/ardent --version").chomp
  end
end
