cask "rinse-m8" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.2"
  sha256 arm:   "16cd6c3ade5cdc86687ba418a3bcd37c34cf25ba8b420cb757dd8cd36764d16e",
         intel: "2bc0bd217204de3fea4fc749ec158c308ba9aefc506ba1b9214ee59f46d9a04d"

  url "https://github.com/idleberg/rinse-m8/releases/download/v#{version}/Rinse-M8_#{version}_#{arch}.dmg"
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
    "~/Library/Application Support/com.idleberg.rinse-m8",
    "~/Library/Caches/com.idleberg.rinse-m8",
    "~/Library/WebKit/com.idleberg.rinse-m8",
  ] + [
    # FIXME: remove old identifier at some point
    "~/Library/Application Support/org.idleberg.rinse-m8",
    "~/Library/Caches/org.idleberg.rinse-m8",
    "~/Library/WebKit/org.idleberg.rinse-m8",
  ]
end
