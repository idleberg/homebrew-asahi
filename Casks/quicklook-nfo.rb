cask "quicklook-nfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.0"
  sha256 arm:   "6da4e35b2a65fcef84e78f8287a3dcd40a1a552e820aeeb8574a890c3023b5b1",
         intel: "d34d45b3c54bbea24acf00141252bca2209caf2831b08f2c57c8959765a50eab"

  url "https://github.com/idleberg/quicklook-nfo/releases/download/v#{version}/quicklook-nfo-v#{version}-#{arch}.zip"
  name "quicklook-nfo"
  desc "A modern, configurable Quicklook plugin for NFO/DIZ files"
  homepage "https://github.com/idleberg/quicklook-nfo/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Quicklook NFO.app"

  postflight do
    args = %W[
      -dr com.apple.quarantine
      #{staged_path}/Quicklook NFO.app
    ]

    system_command "xattr", args: args

    # macOS registers the embedded QuickLook extension only once the containing
    # app has been launched.
    system_command "open", args: ["-g", "#{appdir}/Quicklook NFO.app"]
  end

  uninstall quit: "com.idleberg.Quicklook"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.Quicklook.QuicklookExtension",
    "~/Library/Containers/com.idleberg.Quicklook.QuicklookExtension",
  ]
end
