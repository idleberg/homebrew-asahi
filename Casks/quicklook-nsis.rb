cask "quicklook-nsis" do
  version "0.1.1"
  sha256 "15d3d493f1056e1fc198380c765496f3b3315c4aa2cf7569a7d8ed922d294dfd"

  url "https://github.com/idleberg/quicklook-nsis/releases/download/v#{version}/QuickLook-NSIS-v#{version}.zip"
  name "Quick Look NSIS"
  desc "Quick Look preview for NSIS scripts"
  homepage "https://github.com/idleberg/quicklook-nsis/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Quick Look NSIS.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Quick Look NSIS.app"],
                          writable_paths: ["{{appdir}}/Quick Look NSIS.app"]
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
      You must start `#{appdir}/Quick Look NSIS.app` manually to setup the Quick Look plugin.
    EOS
  end
end
