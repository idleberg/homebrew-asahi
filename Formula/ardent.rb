class Ardent < Formula
  desc "Opinionated formatter for NSIS scripts"
  homepage "https://github.com/idleberg/ardent"
  url "https://github.com/idleberg/ardent/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "170ba20d0c6b291840ecb6a9598dd15cc1ff44517b1b559b97d5e1fe3b05babb"
  license "MIT"
  head "https://github.com/idleberg/ardent.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "ardent v#{version}", shell_output("#{bin}/ardent --version").chomp
  end
end
