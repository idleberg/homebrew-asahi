class Dropboxignore < Formula
  desc "Command-line tool for ignoring files in Dropbox"
  homepage "https://github.com/sp1thas/dropboxignore"
  url "https://github.com/sp1thas/dropboxignore/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "4ef5981c24fe6f5f4c9d4e955f396d48e56ef82b5b0c6fdf8cecb54572e17cf5"
  license "GPL-3.0-only"
  head "https://github.com/sp1thas/dropboxignore.git", branch: "master"

  depends_on "diffutils"
  depends_on "grep"

  def install
    # Do not use 'make install' as it uses hardcoded destination
    bin.install "src/bin/cli.sh" => "dropboxignore"
  end

  test do
    assert_match "dropboxignore: v#{version}", shell_output("#{bin}/dropboxignore version")
  end
end
