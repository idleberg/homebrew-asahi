class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/dent"
  url "https://registry.npmjs.org/@nsis/dent-cli/-/dent-cli-0.9.2.tgz"
  sha256 "19118c6aca28e5879075683c464eccb6ffba76518cc5b7b71b39576f233bab4f"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@nsis/dent-cli/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dent --version")

    (testpath/"test.nsi").write "section\nNOP\nsectionend"
    assert_equal "Section\n\tNop\nSectionEnd\n", shell_output("#{bin}/dent format #{testpath}/test.nsi")
  end
end
