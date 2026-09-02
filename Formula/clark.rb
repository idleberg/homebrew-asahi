class Clark < Formula
  desc "CLI for clark, the Rust port of Bombshell's clack prompts"
  homepage "https://github.com/idleberg/clark"
  url "https://github.com/idleberg/clark/archive/refs/tags/clark-cli-0.1.0.tar.gz"
  sha256 "f5ac3caeb09c8e551f24d8202803ad3309358254e7935408b1fde448fd2c4859"
  license "MIT"
  head "https://github.com/idleberg/clark.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/clark-cli")
  end

  test do
    assert_equal "clark #{version}", shell_output("#{bin}/clark --version").chomp
  end
end
