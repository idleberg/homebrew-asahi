cask "dent-desktop" do
  version "0.2.1"
  sha256  "b2505b8919a4bec7464633934e2fe508b5ecd269c8be824c9f088cccdcbc0f2d"

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
