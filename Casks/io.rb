cask "io" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "13816899b036d38d46f50a4eb95db3667b02e8a48f2f5d5da3339d4b48cf7d1b",
         intel: "9a7e3b526c107207fe405263a712ea95c6598794303c024a77ab9f1be5c7ed42"

  url "https://github.com/idleberg/io/releases/download/v#{version}/io-v#{version}-#{arch}.zip"
  name "io"
  desc "Menu bar utility that routes audio"
  homepage "https://github.com/idleberg/io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

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
