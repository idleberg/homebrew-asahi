cask "diznfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "ae00c5521ac99cffa23c284bec44b23cf993a9038f43368c006a255d1a94d078",
         intel: "58f50c7627a9e8f1f60b44d8ba5c54157cdc566cd9b13e065102db96f506beac"

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
