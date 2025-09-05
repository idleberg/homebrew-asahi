cask "dbxcli" do
  version "3.0.0"

  arch arm: "arm", intel: "amd64"

  url "https://github.com/dropbox/dbxcli/releases/download/v#{version}/dbxcli-linux-#{arch}"
  sha256 arm64_linux:  "806584e4758e59d753c1d7ed0fe97a7ae43fec0240c3bf4d388360bb51daf346",
         x86_64_linux: "3ff6e29675095063a5ba7101115cf7f809f3deddf14998ac61bf7a0330d736cb"
  binary "dbxcli-linux-#{arch}", target: "dbxcli"

  on_macos do
    url "https://github.com/dropbox/dbxcli/releases/download/v#{version}/dbxcli-darwin-amd64"
    sha256 "1149a2aa6a89829c6d540d04cc1db8cf5bb27e3d8b0ec6b32d830a6818bd7573"
    binary "dbxcli-darwin-amd64", target: "dbxcli"
  end

  name "dbxcli"
  desc "Command-line client for Dropbox"
  homepage "https://github.com/dropbox/dbxcli"
end
