cask "rinse-m8" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.1"
  sha256 arm:   "0f0b8355efa561f9a90f65a3bc09b2d1105cf76b10f7621ac9d3aa5ecbbb0ee8",
         intel: "52c8c33bf211c960fbd8fa52b04f343e2c98421d4aa35465290442e17d63c892"

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
