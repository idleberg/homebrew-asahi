class Pupdate < Formula
  desc "Command-line tool for updating your Analogue Pocket"
  homepage "https://mattpannella.github.io/pupdate/"
  url "https://github.com/mattpannella/pupdate/archive/refs/tags/4.5.0.tar.gz"
  sha256 "80d3f515434e076afc2613178b99e12ee772d9aa4e3d2b70fc70ada7dc5a4365"
  license "MIT"

  depends_on "dotnet" => :build

  def install
    os = if OS.mac?
      "osx"
    else
      "linux"
    end

    args = [
      "publish",
      "pupdate.csproj",
      "-r", "#{os}-x64",
      "--self-contained",
      "true",
      "-c",
      "Release",
      "-o",
      "App-#{version}-#{os}",
      "--consoleloggerparameters:ErrorsOnly",
      "-p:PublishTrimmed=#{OS.mac?}",
      "-p:TrimMode=partial"
    ]

    system "dotnet", *args
  end

  test do
    assert_equal "pupdate v#{version}", shell_output("#{bin}/pupdate --version").chomp
  end
end
