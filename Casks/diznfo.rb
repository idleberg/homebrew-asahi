cask "diznfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "ae00c5521ac99cffa23c284bec44b23cf993a9038f43368c006a255d1a94d078",
         intel: "58f50c7627a9e8f1f60b44d8ba5c54157cdc566cd9b13e065102db96f506beac"

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

  postflight do
    system_command "xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Diznfo.app"]

    system_command "/usr/bin/pluginkit",
                   args: ["-a", "#{appdir}/Diznfo.app/Contents/PlugIns/DiznfoExtension.appex"]
  end

  uninstall_preflight do
    system_command "/usr/bin/pluginkit",
                   args: ["-r", "#{appdir}/Diznfo.app/Contents/PlugIns/DiznfoExtension.appex"]
  end

  uninstall quit: "com.idleberg.Diznfo"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.Diznfo.DiznfoExtension",
    "~/Library/Containers/com.idleberg.Diznfo.DiznfoExtension",
    "~/Library/Preferences/com.idleberg.Diznfo.plist",
    "~/Library/Saved Application State/com.idleberg.Diznfo.savedState",
  ]
end
