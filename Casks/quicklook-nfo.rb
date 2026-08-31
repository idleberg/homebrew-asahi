cask "quicklook-nfo" do
  version "0.0.0"
  sha256 "6da4e35b2a65fcef84e78f8287a3dcd40a1a552e820aeeb8574a890c3023b5b1"

  url "https://github.com/idleberg/quicklook-nfo/releases/download/v#{version}/quicklook-nfo-v#{version}.zip"
  name "quicklook-nfo"
  desc "QuickLook extension for CP437 ASCII/ANSI-art .nfo and .diz files"
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
