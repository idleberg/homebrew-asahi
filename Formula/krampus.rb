class Krampus < Formula
  desc "Command-line tool to kill one or more processes by their port number"
  homepage "https://github.com/idleberg/krampus"
  url "https://github.com/idleberg/krampus/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "37bc87fc4f8b63c35c0b7b27d9fddb763cdfc64eca7930b818350329a56f0ccb"
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
