class Desmack < Formula
  desc "Extracts the assets of a Super Mario Kart SNES ROM"
  homepage "https://github.com/idleberg/desmack"
  url "https://github.com/idleberg/desmack/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6ed5f792494a76b44404cfda9c2357e7c4a270e8b5b309c4cc27fa8eef395e11"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/idleberg/desmack.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"ardent", "--completions")
  end

  test do
    assert_equal "desmack #{version}", shell_output("#{bin}/desmack --version").chomp
  end
end
