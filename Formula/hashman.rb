class Hashman < Formula
  desc "Command-line tool to calculate multiple checksums at once"
  homepage "https://github.com/idleberg/hashman"
  url "https://github.com/idleberg/hashman/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7b525f1816895a013c4c6d1ebb324199fdf42f2d34fae61a38e707ece3f6c8ab"
  license "MIT"
  head "https://github.com/idleberg/hashman.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/hashman --version").chomp
  end
end
