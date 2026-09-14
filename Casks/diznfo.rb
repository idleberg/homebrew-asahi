cask "diznfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.2"
  sha256 arm:   "e426f6bc2c185c864ff79ca371c926f38ee5b294e4cd69d6024ed0c6aa77d816",
         intel: "9e8c917374fda489662212815068a18935a611097ac97598778fcd95fa1be35e"

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
    system_command "xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Diznfo.app"]

    system_command "/usr/bin/pluginkit",
                   args: ["-a", "#{appdir}/Diznfo.app/Contents/PlugIns/DiznfoExtension.appex"]
  end

  uninstall_preflight_steps do
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
