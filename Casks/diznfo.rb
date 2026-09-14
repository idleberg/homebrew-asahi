cask "diznfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "2947116530478074257dc6c174663ce1ce97fd189eab0cffd16775d664cfb493",
         intel: "91bcbc231bbf96d9e0edd797d50f56c764a3bf77f088b8b5ec88a6c641df10d7"

  url "https://github.com/idleberg/diznfo/releases/download/v#{version}/diznfo-v#{version}-#{arch}.zip"
  name "Diznfo"
  desc "Modern, configurable viewer and Quicklook plugin for NFO/DIZ files"
  homepage "https://github.com/idleberg/diznfo/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Diznfo.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Diznfo.app"],
                          writable_paths: ["{{appdir}}/Diznfo.app"]
  end

  uninstall quit: "com.idleberg.Diznfo"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.Diznfo.DiznfoExtension",
    "~/Library/Containers/com.idleberg.Diznfo.DiznfoExtension",
    "~/Library/Preferences/com.idleberg.Diznfo.plist",
    "~/Library/Saved Application State/com.idleberg.Diznfo.savedState",
  ]
end
