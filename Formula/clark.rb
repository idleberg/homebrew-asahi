class Clark < Formula
  desc "CLI for clark, the Rust port of Bombshell's clack prompts"
  homepage "https://github.com/idleberg/clark"
  url "https://github.com/idleberg/clark/archive/refs/tags/clark-cli-0.2.0.tar.gz"
  sha256 "66e1e26dda856b10ff8b0b7fdc3a32940fcaada8dfd449dc362e58b6ea11d81c"
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
