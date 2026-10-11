cask "quicklook-svelte" do
  version "0.1.0"
  sha256 "b95cb09baba9e01eff8823a0f5e0e459374ebb191195ecbc5828b67b18342d23"

  url "https://github.com/idleberg/quicklook-svelte/releases/download/v#{version}/QuickLook-Svelte-v#{version}.zip"
  name "QuickLook Svelte"
  desc "QuickLook preview for Svelte components"
  homepage "https://github.com/idleberg/quicklook-svelte/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "QuickLook Svelte.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/QuickLook Svelte.app"],
                          writable_paths: ["{{appdir}}/QuickLook Svelte.app"]
  end

  uninstall quit: "com.idleberg.QuickLookSvelte"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.QuickLookSvelte.Extension",
    "~/Library/Containers/com.idleberg.QuickLookSvelte.Extension",
    "~/Library/Preferences/com.idleberg.QuickLookSvelte.plist",
    "~/Library/Saved Application State/com.idleberg.QuickLookSvelte.savedState",
  ]
end
