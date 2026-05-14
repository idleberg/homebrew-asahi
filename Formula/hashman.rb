class Hashman < Formula
  desc "Command-line tool to calculate multiple checksums at once"
  homepage "https://github.com/idleberg/hashman"
  url "https://github.com/idleberg/hashman/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4c554a62b5ea073e28e3275279b79cd2b51ff4296b9081be0f884b2776f9ac37"
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
