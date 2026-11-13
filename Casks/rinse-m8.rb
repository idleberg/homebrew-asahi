cask "rinse-m8" do
  arch arm: "aarch64", intel: "x64"

  version "0.19.1"
  sha256 arm:   "3364b4702adf3819c14e8dd8b4d8c6e070fa4fad74600c0de5127d8ba7cf94bc",
         intel: "3aecc3ea80889fb677a7072544557457b38a44ed2dcd6b5f6d966df3506bc676"

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
