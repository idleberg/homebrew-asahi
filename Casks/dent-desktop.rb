cask "dent-desktop" do
  version "0.2.4"
  sha256  "32745de86fd97e56b143cdeedbe1ffea3f3e7d28a25a7fb9f300f763c8b1ebd4"

  url "https://github.com/idleberg/dent-desktop/releases/download/v#{version}/dent-#{version}-darwin.zip"
  name "Dent"
  desc "A desktop application for dent, the opinionated NSIS code formatter."
  homepage "https://github.com/idleberg/dent-desktop/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Dent.app"

  postflight do
    args = %W[
      -dr com.apple.quarantine
      #{staged_path}/Dent.app
    ]

    system_command "xattr", args: args
  end

  zap trash: [
    "~/Library/Application Support/org.idleberg.dent",
    "~/Library/Caches/org.idleberg.dent",
    "~/Library/WebKit/org.idleberg.dent",
  ]
end
