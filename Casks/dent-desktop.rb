cask "dent-desktop" do
  version "0.2.3"
  sha256  "0897e4fb1b07deeee328f4213fe6ca72b355e9de4237e406a76ce45d9384172a"

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
