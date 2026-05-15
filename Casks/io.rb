cask "io" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "f2366a1ca6e78cb41863ea1c7313c0034730277439735a749c20b8d8e08a4ef1",
         intel: "b539b85de41e1dee897035c114e5b4a4e44594ca61d1f85076825b5cd8c9b087"

  url "https://github.com/idleberg/io/releases/download/v#{version}/io-v#{version}-#{arch}.zip"
  name "io"
  desc "Menu bar utility that routes audio"
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
