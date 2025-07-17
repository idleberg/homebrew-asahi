class Dbxcli < Formula
  desc "Command-line client for Dropbox"
  homepage "https://github.com/dropbox/dbxcli"
  url "https://github.com/dropbox/dbxcli/releases/download/v3.0.0/dbxcli-darwin-amd64"
  sha256 "1149a2aa6a89829c6d540d04cc1db8cf5bb27e3d8b0ec6b32d830a6818bd7573"
  license "MIT"
  head "https://github.com/dropbox/dbxcli.git", branch: "master"

  def install
    bin.install "dbxcli-darwin-amd64" => "dbxcli"
  end

  test do
    output = system "bin/dbxcli", "--help"
    assert_match <<~EOS, output
      Use dbxcli to quickly interact with your Dropbox, upload/download files,
      manage your team and more. It is easy, scriptable and works on all platforms!
    EOS
  end
end
