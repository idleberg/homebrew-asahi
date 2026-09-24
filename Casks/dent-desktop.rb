cask "dent-desktop" do
  version "0.2.8"
  sha256  "574180a043caf120f4bae1951d73a785193eadb1f1e9ab5562e1d115ebc6544b"

  url "https://github.com/idleberg/dent-desktop/releases/download/v#{version}/dent-#{version}-darwin.zip"
  name "Dent"
  desc "Desktop application for dent, the opinionated NSIS code formatter"
  homepage "https://github.com/idleberg/dent-desktop/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Dent.app"

  postflight_steps do
    run "/usr/bin/xattr", args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Dent.app"],
                          writable_paths: ["{{appdir}}/Dent.app"]
  end

  zap trash: [
    "~/Library/Application Support/org.idleberg.dent",
    "~/Library/Caches/org.idleberg.dent",
    "~/Library/WebKit/org.idleberg.dent",
  ]
end
