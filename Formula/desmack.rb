class Desmack < Formula
  desc "Extracts the assets of a Super Mario Kart SNES ROM"
  homepage "https://github.com/idleberg/desmack"
  url "https://github.com/idleberg/desmack/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "73b603c61e281551946b1598a83d48f49f391370908899b8970ffe8ee69e122b"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/idleberg/desmack.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"desmack", "--completions")
  end

  test do
    assert_equal "desmack #{version}", shell_output("#{bin}/desmack --version").chomp
  end
end
