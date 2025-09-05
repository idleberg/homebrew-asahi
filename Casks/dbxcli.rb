cask "dbxcli" do
  arch arm: "amd64"
  os macos: "darwin", linux: "linux"

  version "3.0.0"
  sha256 macos: "1149a2aa6a89829c6d540d04cc1db8cf5bb27e3d8b0ec6b32d830a6818bd7573",
         intel: "806584e4758e59d753c1d7ed0fe97a7ae43fec0240c3bf4d388360bb51daf346"

  url "https://github.com/dropbox/dbxcli/releases/download/v#{version}/dbxcli-#{os}-#{arch}"
  name "dbxcli"
  desc "Command-line client for Dropbox"
  homepage "https://github.com/dropbox/dbxcli"

  binary "dbxcli-#{os}-#{arch}", target: "dbxcli"
end
