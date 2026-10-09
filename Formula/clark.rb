class Clark < Formula
  desc "CLI for clark, the Rust port of Bombshell's clack prompts"
  homepage "https://github.com/idleberg/clark"
  url "https://github.com/idleberg/clark/archive/refs/tags/clark-cli-v0.3.0.tar.gz"
  sha256 "4d6117337026f4b7606e022f60a64ddb6fa45a27b0c353faa33aafff72b0f956"
  license "MIT"
  head "https://github.com/idleberg/clark.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/clark-cli")
    generate_completions_from_executable(bin/"clark", "--completions")
  end

  test do
    assert_equal "clark #{version}", shell_output("#{bin}/clark --version").chomp
  end
end
