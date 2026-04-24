cask "io" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "6a45d73a7ed71cf211c19d0d4a2ff82ad6287374efbfd86a2048677f4db67e26",
         intel: "073cc1f9ab02595b467890ddef2ef1e0cd6f09a9b9332eda9dee838461111ba0"

  url "https://github.com/idleberg/io/releases/download/v#{version}/io-v#{version}-#{arch}.zip"
  name "io"
  desc "Removes sharing IDs and other tracking parameters from URLs"
  homepage "https://github.com/idleberg/io"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "io.app"

  postflight do
    args = %W[
      -dr com.apple.quarantine
      #{staged_path}/io.app
    ]

    system_command "xattr", args: args
  end

  zap trash: [
    "~/Library/Preferences/com.idleberg.io.plist",
  ]
end
