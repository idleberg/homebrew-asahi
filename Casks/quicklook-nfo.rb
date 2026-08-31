cask "quicklook-nfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.0"
  sha256 arm:   "6da4e35b2a65fcef84e78f8287a3dcd40a1a552e820aeeb8574a890c3023b5b1",
         intel: "d34d45b3c54bbea24acf00141252bca2209caf2831b08f2c57c8959765a50eab"

  url "https://github.com/idleberg/quicklook-nfo/releases/download/v#{version}/quicklook-nfo-v#{version}-#{arch}.zip"
  name "Quicklook NFO"
  desc "Modern, configurable Quicklook plugin for NFO/DIZ files"
  homepage "https://github.com/idleberg/quicklook-nfo/"

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
