cask "cleansi" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "a4bb7cd67149b32082cc110e7f27357323844b5072091bc9d368cf80b380fc3f",
         intel: "9d0b63cfbfd5823af9a79bd2afac7e748fed8915568df1cdea9650e8a503d7f5"

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
    "~/Library/Preferences/org.idleberg.Cleansi.plist",
  ]
end
