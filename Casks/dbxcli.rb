cask "dbxcli" do
  version "3.0.0"

  url "https://github.com/dropbox/dbxcli/releases/download/v#{version}/dbxcli-darwin-amd64"
  sha256 "1149a2aa6a89829c6d540d04cc1db8cf5bb27e3d8b0ec6b32d830a6818bd7573"
  binary "dbxcli-darwin-amd64", target: "dbxcli"

  name "dbxcli"
  desc "Command-line client for Dropbox"
  homepage "https://github.com/dropbox/dbxcli"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :el_capitan"

  postflight do
    args = %W[
      -d com.apple.quarantine
      #{staged_path}/dbxcli
    ]

    system_command "xattr", args: args
  end

  caveats do
    requires_rosetta
  end
end
