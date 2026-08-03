class Dent < Formula
  desc "Opinionated code formatter for NSIS scripts"
  homepage "https://github.com/idleberg/dent"
  url "https://registry.npmjs.org/@nsis/dent-cli/-/dent-cli-0.10.0.tgz"
  sha256 "5055f7035d90d7c4e1ec4ade0a6127cda4a92a22d70816294690844c8f0d9d34"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@nsis/dent-cli/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  def install
    # Override --min-release-age in our CI to allow testing freshly published releases
    ci_args = if ENV["CI"] && ENV["GITHUB_REPOSITORY"] == "idleberg/homebrew-asahi"
      ["--min-release-age=0"]
    else
      []
    end

    system "npm", "install", *std_npm_args, *ci_args
    bin.install_symlink Dir[libexec/"bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dent --version")

    (testpath/"test.nsi").write "section\nNOP\nsectionend"
    assert_equal "Section\n\tNop\nSectionEnd\n", shell_output("#{bin}/dent format #{testpath}/test.nsi")
  end
end
