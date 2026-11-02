cask "rinse-m8" do
  version "0.6.1"
  sha256 "c37ef48feebc85ac30df2af266ff774da3a956b6c65f889736fd136adc80e710"

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
