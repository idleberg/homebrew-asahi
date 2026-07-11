cask "dent-desktop" do
  version "0.1.0"
  sha256  "adaed3ff9989ada035daf584e931d1f251225f768d85d738dc48afc457546b10"

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
end
