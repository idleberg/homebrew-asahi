class Tgrep < Formula
  desc "Trigram-indexed grep for fast regex search in large codebases"
  homepage "https://github.com/microsoft/tgrep"
  url "https://github.com/microsoft/tgrep/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "6c8665ca44eb60b0d1e52afc17a98ded645ead8bc7822433842437094ad10bfc"
  license "MIT"
  head "https://github.com/microsoft/tgrep.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "tgrep-cli")
  end

  test do
    (testpath/"src").mkpath
    (testpath/"src/main.rs").write <<~RUST
      fn main() {
          println!("hello trigram");
      }
    RUST
    (testpath/"src/lib.rs").write <<~RUST
      pub fn helper() -> u32 { 42 }
    RUST
    (testpath/"notes.txt").write "nothing to see here\n"

    system bin/"tgrep", "index", testpath

    matches = shell_output("#{bin}/tgrep 'hello trigram' #{testpath}")
    assert_match "src/main.rs", matches
    assert_match "hello trigram", matches

    files = shell_output("#{bin}/tgrep 'fn ' #{testpath} -l")
    assert_match "src/main.rs", files
    assert_match "src/lib.rs", files
    refute_match "notes.txt", files

    assert_equal "3", shell_output("#{bin}/tgrep count-files #{testpath} 2>/dev/null").strip

    assert_match version.to_s, shell_output("#{bin}/tgrep --version")
  end
end
