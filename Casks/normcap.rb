cask "normcap" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "69ce59d6ac3fb6420d62b7fc2ac5bf703b5b34eec05ad319a41b1c2f979f9ee2",
         intel: "de620d4bd4b9db0f24fc354f9db29a87ae32c0ccc6ff63cbb34456d175ff0e5e"

  url "https://github.com/dynobo/normcap/releases/download/v#{version}/NormCap-#{version}-#{arch}-macOS.dmg"
  name "NormCap"
  desc "OCR-powered screenshot tool to capture text instead of images"
  homepage "https://dynobo.github.io/normcap/"

  depends_on macos: ">= :ventura"

  app "NormCap.app"

  postflight do
    args = %W[
      -d com.apple.quarantine
      #{staged_path}/NormCap.app
    ]

    system_command "xattr", args: args
  end
end
