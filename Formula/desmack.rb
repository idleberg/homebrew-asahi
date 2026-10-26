class Desmack < Formula
  desc "Extracts the assets of a Super Mario Kart SNES ROM"
  homepage "https://github.com/idleberg/desmack"
  url "https://github.com/idleberg/desmack/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "247618a6d4e14c6bfbe448e8a373193c8ce27aa74a753b62d20a6027626648fe"
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
