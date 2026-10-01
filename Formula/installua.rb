class Installua < Formula
  desc "Lua-shaped language that compiles to NSIS"
  homepage "https://github.com/idleberg/installua"
  url "https://github.com/idleberg/installua/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f2443901b945b8778a4ccc93faeb645c2a6d38943d28c155d67f41cc195f7e22"
  license "Apache-2.0"
  head "https://github.com/idleberg/installua.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "installua #{version}", shell_output("#{bin}/installua --version").chomp

    (testpath/"install.lua").write <<~LUA
      attributes { name = "A", outFile = "a.exe" }
      installer { page.instFiles {}, section("Core", function() detailPrint("x") end) }
    LUA

    nsis = shell_output("#{bin}/installua emit install.lua --stdout")
    assert_match "OutFile \"a.exe\"", nsis
    assert_match "DetailPrint \"x\"", nsis
  end
end
