cask "dent-desktop" do
  version "0.2.7"
  sha256  "0bad78c8fa389708d90c804b856833ae49d20707e441a16acdc3e821b60f00a9"

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
