cask "cleansi" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.3"
  sha256 arm:   "66941162d832a29fad1bd1524aead4ad2e2bf354375d348d6b933610060f3c8e",
         intel: "46b0c40afca96c12ed25dd12be839a2f6a29b6865ce058a3c5b994cd05ea0fb8"

  url "https://github.com/idleberg/cleansi/releases/download/v#{version}/Cleansi-v#{version}-#{arch}.zip"
  name "Cleansi"
  desc "Removes sharing IDs and other tracking parameters from URLs"
  homepage "https://github.com/idleberg/cleansi"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Cleansi.app"

  zap trash: [
    "~/Library/Preferences/org.idleberg.Cleansi.plist",
  ]
end
