cask "krampus" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "Darwin", linux: "Linux"

  version "0.3.0"
  sha256 arm:          "199d6868f2c9655078ea65fb9af0a91d2df6b16234c8569a065c7add70cbec3b",
         intel:        "5bb46917e6cf51efb69ae62e43e658fd06869344d08ebd700cf4143e38784dc7",
         arm64_linux:  "4092a0980a6af921c4c61f427a41076d86922510658ebecfa9ab5b2c96d18bed",
         x86_64_linux: "640da04956ac1e3e39a6922f040e7cd2cdabd9007f065f4ea4f5ab9f1cfe2cbf"

  url "https://github.com/idleberg/krampus/releases/download/v#{version}/krampus-#{version}-#{os}-#{arch}.tar.gz"
  name "krampus"
  desc "Command-line tool to kill one or more processes by their port number"
  homepage "https://github.com/idleberg/krampus"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "krampus"

  on_macos do
    postflight do
      args = %W[
        -d com.apple.quarantine
        #{staged_path}/krampus
      ]

      system_command "xattr", args: args
    end
  end
end
