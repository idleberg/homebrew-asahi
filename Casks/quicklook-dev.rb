cask "quicklook-dev" do
  version "0.1.0"
  sha256 "4bbdb3e3cf9736e6a0f865e151d0e02185d42468267e0c91e4a9c7b9b9e0c530"

  url "https://github.com/idleberg/quicklook-dev/releases/download/v#{version}/QuickLook-Dev-v#{version}.zip"
  name "QuickLook Dev"
  desc "Quick Look plugin for developers, highlights languages supported by Twinklepop"
  homepage "https://github.com/idleberg/quicklook-dev/"

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
