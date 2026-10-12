cask "quicklook-nsis" do
  version "0.1.0"
  sha256 "82393bee8747bde7bc7aeb29979b627430f62ab10b9073f6c909dc6ace680ba4"

  url "https://github.com/idleberg/quicklook-nsis/releases/download/v#{version}/QuickLook-NSIS-v#{version}.zip"
  name "QuickLook NSIS"
  desc "QuickLook preview for NSIS scripts"
  homepage "https://github.com/idleberg/quicklook-nsis/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "QuickLook NSIS.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/QuickLook NSIS.app"],
                          writable_paths: ["{{appdir}}/QuickLook NSIS.app"]
  end

  uninstall quit: "com.idleberg.QuickLookNSIS"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.QuickLookNSIS.Extension",
    "~/Library/Containers/com.idleberg.QuickLookNSIS.Extension",
    "~/Library/Preferences/com.idleberg.QuickLookNSIS.plist",
    "~/Library/Saved Application State/com.idleberg.QuickLookNSIS.savedState",
  ]

  caveats do
    <<~EOS
      You must start `#{appdir}/QuickLook NSIS.app` manually to setup the Quick Look plugin.
    EOS
  end
end
