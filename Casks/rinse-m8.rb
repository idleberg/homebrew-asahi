cask "rinse-m8" do
  arch arm: "aarch64", intel: "x64"

  version "0.20.1"
  sha256 arm:   "bebc1ee621ee427f0632f2f52a8943d677c9bdc1b0e4a7d0ec277fd1fce302f3",
         intel: "9f47e7ca9d29850545d0a4b2eb6be20c5fac5b4ccc24dfebe6998aca9495aef4"

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
