cask "normcap" do
   arch arm: "arm64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "69ce59d6ac3fb6420d62b7fc2ac5bf703b5b34eec05ad319a41b1c2f979f9ee2",
         intel: "de620d4bd4b9db0f24fc354f9db29a87ae32c0ccc6ff63cbb34456d175ff0e5e"

  url "https://github.com/dynobo/normcap/releases/download/v#{version}/NormCap-#{version}-#{arch}-macOS.dmg"
  name "8x8_work"
  desc "Communications application with voice, video, chat, and web conferencing"
  homepage "https://www.8x8.com/products/apps"

  depends_on macos: ">= :ventura"

  app "NormCap.app"
end
