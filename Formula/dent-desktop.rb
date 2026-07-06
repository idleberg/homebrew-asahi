class DentDesktop < Formula
  desc "Desktop application for the opinionated NSIS code formatter"
  homepage "https://github.com/idleberg/dent-desktop"
  license "MIT"
  head "https://github.com/idleberg/dent-desktop.git", branch: "main"

  depends_on "deno" => :build
  depends_on :macos

  def install
    system "deno", "task", "bundle"
    system "deno", "task", "build"
    prefix.install "Dent.app"
  end

  test do
    assert_path_exists prefix/"Dent.app/Contents/MacOS/laufey_webview"
  end
end
