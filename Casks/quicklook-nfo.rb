cask "quicklook-nfo" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "2c8ebba9cd35fc6f6298c4d2ac9187fafdea743ecf2b1763fa161a6b377474d9",
         intel: "0f3939e72005fd6cd55671f22583243d941f0f4de12ebbf8ffc7daee23de84a5"

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
