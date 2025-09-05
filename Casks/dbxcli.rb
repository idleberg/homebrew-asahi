cask "dbxcli" do
  version "3.0.0"
  sha256 "1149a2aa6a89829c6d540d04cc1db8cf5bb27e3d8b0ec6b32d830a6818bd7573"

  url "https://github.com/dropbox/dbxcli/releases/download/v#{version}/dbxcli-darwin-amd64"
  name "dbxcli"
  desc "Command-line client for Dropbox"
  homepage "https://github.com/dropbox/dbxcli"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :x86_64
  depends_on macos: ">= :el_capitan"

  binary "dbxcli-darwin-amd64", target: "dbxcli"

  caveats do
    requires_rosetta
  end
end
