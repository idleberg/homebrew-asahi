class Hashman < Formula
  desc "Command-line tool to calculate multiple checksums at once"
  homepage "https://github.com/idleberg/hashman"
  url "https://github.com/idleberg/hashman/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "e46caad27a86fee5c98b92d5ea63791b5252e7acaa86be9851cbd1424daddd57"
  license "MIT"
  head "https://github.com/idleberg/hashman.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_equal "hashman version #{version}", shell_output("#{bin}/hashman --version").chomp
  end
end
