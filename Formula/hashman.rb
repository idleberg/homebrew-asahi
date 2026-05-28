class Hashman < Formula
  desc "Command-line tool to calculate multiple checksums at once"
  homepage "https://github.com/idleberg/hashman"
  url "https://github.com/idleberg/hashman/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "f94f1d74906088323c34be8e6ee4aebe68a69536c362f77bfbe71f7c7633a72e"
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
