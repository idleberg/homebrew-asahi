cask "rinse-m8" do
  arch arm: "aarch64", intel: "x64"

  version "0.20.0"
  sha256 arm:   "a41affe65bd3aafdd915d46b6a8a61df227d6738c8c9329cf73a0693dc316d3c",
         intel: "09fe1477c333204dc435a079eb26a44974b9ebd912801530ddad561c8e60c3e0"

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
