cask "quicklook-nsis" do
  version "0.3.0"
  sha256 "4732c46391402aa0b4657dc4dc084f39685e2cbd1b5a3a27e1e3386c144ef646"

  url "https://github.com/idleberg/quicklook-nsis/releases/download/v#{version}/Quick-Look-NSIS-v#{version}-macos.zip"
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
