class Normcap < Formula
  desc "OCR powered screen-capture tool to capture information instead of images"
  homepage "https://dynobo.github.io/normcap/"
  url "https://github.com/dynobo/normcap/archive/refs/tags/v0.6.0.tar.gz"
  version "0.6.0"
  sha256 "aae35b423c2cc586ffc01cc556b4e7965133cc24cea296677efdac3de134cd50"
  license "NOASSERTION"

  depends_on "tesseract"
  depends_on "tesseract-lang"
  depends_on "uv" => :build
  depends_on :macos

  def install
    system "uv", "run", "poe", "bundle"
    prefix.install "build/normcap/mac/app/Normcap.app"
  end

  test do
    system "false"
  end
end
