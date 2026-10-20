cask "quicklook-svelte" do
  version "0.2.0"
  sha256 "5ff782e1f53e51b3589cbe08a3e5b61f44b6817f7e1b38aa7f2dbf345e0c442a"

  url "https://github.com/idleberg/quicklook-svelte/releases/download/v#{version}/Quick-Look-Svelte-v#{version}.zip"
  name "Quick Look Svelte"
  desc "Quick Look preview for Svelte components"
  homepage "https://github.com/idleberg/quicklook-svelte/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Quick Look Svelte.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Quick Look Svelte.app"],
                          writable_paths: ["{{appdir}}/Quick Look Svelte.app"]
  end

  uninstall quit: "com.idleberg.QuickLookSvelte"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.QuickLookSvelte.Extension",
    "~/Library/Containers/com.idleberg.QuickLookSvelte.Extension",
    "~/Library/Preferences/com.idleberg.QuickLookSvelte.plist",
    "~/Library/Saved Application State/com.idleberg.QuickLookSvelte.savedState",
  ]

  caveats do
    <<~EOS
      You must start `#{appdir}/Quick Look Svelte.app` manually to setup the Quick Look plugin.
    EOS
  end
end
