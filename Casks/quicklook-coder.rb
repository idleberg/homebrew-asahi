cask "quicklook-coder" do
  version "0.1.1"
  sha256 "68de7a51540657ec2c7de890ee74659e5e6975a0a612e905c6c7e8480742eb3b"

  url "https://github.com/idleberg/quicklook-coder/releases/download/v#{version}/Quick-Look-Coder-v#{version}.zip"
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
