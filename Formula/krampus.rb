class Krampus < Formula
  desc "Command-line tool to kill one or more processes by their port number"
  homepage "https://github.com/idleberg/krampus"
  url "https://github.com/idleberg/krampus/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "3c326730c8b228898e1c08c80888d9f11a46f66efe708fda796b3e7f7285e510"
  license "MIT"
  head "https://github.com/idleberg/krampus.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/krampus --version").chomp
  end
end
