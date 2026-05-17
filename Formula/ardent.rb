class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "37fe635058f6b9131485112f01a74f3d1c5f38ea88a370cefa7bd6bbab5cbe5f"
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
