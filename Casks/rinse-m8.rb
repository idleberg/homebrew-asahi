cask "rinse-m8" do
  version "0.6.0"
  sha256 "1c5ca00326cd52ebe0d6eca87d590d58e63eec00ce90484d897a270d1d8a0d0f"

  url "https://github.com/idleberg/rinse-m8/releases/download/v#{version}/Rinse-M8_#{version}_universal.dmg"
  name "Rinse M8"
  desc "Browse, download and listen to on-demand episodes from rinse.fm"
  homepage "https://github.com/idleberg/rinse-m8/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Rinse M8.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Rinse M8.app"],
                          writable_paths: ["{{appdir}}/Rinse M8.app"]
  end

  zap trash: [
    "~/Library/Application Support/org.idleberg.rinse-m8",
    "~/Library/Caches/org.idleberg.rinse-m8",
    "~/Library/WebKit/org.idleberg.rinse-m8",
  ]
end
