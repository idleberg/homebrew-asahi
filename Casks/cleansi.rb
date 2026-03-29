cask "cleansi" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.1"
  sha256 arm:   "a948cc4bcdd1583c73d744ee8948db2e1503ff0b69213e865105564f88c4a9f9",
         intel: "1f6cc5a8ffaffc5dd9dda814351247f70f35bc6886f145f2e2c2248e3d415120"

  url "https://github.com/idleberg/cleansi/releases/download/v#{version}/Cleansi-v#{version}-#{arch}.zip"
  name "Cleansi"
  desc "Removes sharing IDs and other tracking parameters from URLs"
  homepage "https://github.com/idleberg/cleansi"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Cleansi.app"

  postflight do
    args = %W[
      -dr com.apple.quarantine
      #{staged_path}/Cleansi.app
    ]

    system_command "xattr", args: args
  end

  zap trash: [
    "~/Library/Preferences/com.idleberg.Cleansi.plist",
  ]
end
