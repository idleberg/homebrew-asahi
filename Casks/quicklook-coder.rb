cask "quicklook-coder" do
  version "0.3.1"
  sha256 "e744d3d1764584e4b6e475f35eb96ae9955a6c37af63177d4b1fe4c01bb1bc31"

  url "https://github.com/idleberg/quicklook-coder/releases/download/v#{version}/Quick-Look-Coder-v#{version}-macos.zip"
  name "Quick Look Coder"
  desc "Quick Look plugin for developers, highlights languages supported by Twinklepop"
  homepage "https://github.com/idleberg/quicklook-coder/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Quick Look Coder.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Quick Look Coder.app"],
                          writable_paths: ["{{appdir}}/Quick Look Coder.app"]
  end

  uninstall quit: "com.idleberg.QuickLookCoder"

  zap trash: [
    "~/Library/Application Scripts/com.idleberg.QuickLookCoder.Extension",
    "~/Library/Containers/com.idleberg.QuickLookCoder.Extension",
    "~/Library/Preferences/com.idleberg.QuickLookCoder.plist",
    "~/Library/Saved Application State/com.idleberg.QuickLookCoder.savedState",
  ]

  caveats do
    <<~EOS
      You must start `#{appdir}/Quick Look Coder.app` manually to setup the Quick Look plugin.
    EOS
  end
end
