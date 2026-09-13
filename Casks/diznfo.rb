cask "diznfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "9014eb70e7b0f7f18b97d46e6ef0c102bbaa2596cb01e1895134816cd511797c",
         intel: "8bbd107ae2723114068aeec26fd8493b22a684e81f07097bdc8f6c330d7bcda8"

  url "https://github.com/idleberg/diznfo/releases/download/v#{version}/diznfo-v#{version}-#{arch}.zip"
  name "Quicklook NFO"
  desc "Modern, configurable viewer and Quicklook plugin for NFO/DIZ files"
  homepage "https://github.com/idleberg/diznfo/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Quicklook NFO.app"

  postflight do
    system_command "xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Quicklook NFO.app"]

    # Registers the embedded extension directly, so the user does not have to
    # launch the app first. `open -g` would work too, but the app is a single
    # settings window with no menu bar item — it would surface on next activate.
    system_command "/usr/bin/pluginkit",
                   args: ["-a", "#{appdir}/Quicklook NFO.app/Contents/PlugIns/QuicklookNFOExtension.appex"]
  end

  uninstall_preflight do
    # Without this the registration outlives the bundle, and LaunchServices
    # keeps serving the dead extension until its cache is rebuilt.
    system_command "/usr/bin/pluginkit",
                   args: ["-r", "#{appdir}/Quicklook NFO.app/Contents/PlugIns/QuicklookNFOExtension.appex"]
  end

  uninstall quit: "com.idleberg.QuicklookNFO"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.QuicklookNFO.QuicklookNFOExtension",
    "~/Library/Containers/com.idleberg.QuicklookNFO.QuicklookNFOExtension",
  ]
end
