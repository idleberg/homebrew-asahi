cask "cleansi" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.2"
  sha256 arm:   "306cfe1eb77f47328343e5df0bdfa89caf3df88d59d57b8bd81e556b0be03dd9",
         intel: "e934de36979cf949b04f723f1bf1f90bd8ff18745a5632a72250ba501c4b1809"

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
