class Krampus < Formula
  desc "Command-line tool to kill one or more processes by their port number"
  homepage "https://github.com/idleberg/krampus"
  url "https://github.com/idleberg/krampus/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "a635dcd002acc36c3b5c38c4583ec9ffddd2f18ff24d92b79a70ec8baf4b387a"
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
