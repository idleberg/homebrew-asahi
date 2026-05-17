class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "35ceb8fae6a8998ff9aeb32d7daf1915bfbe4299b539bf311e2520e6f3b2fcc0"
  license "MIT"
  head "https://github.com/idleberg/ardent.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent #{version}", shell_output("#{bin}/ardent --version").chomp
  end
end
