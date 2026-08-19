class Pklenv < Formula
  desc "Typed, cascading environment config backed by Pkl"
  homepage "https://github.com/idleberg/pklenv"
  url "https://github.com/idleberg/pklenv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e05b2f1ea7ed6a7a6085fbd17102c3cdcfbe2937bf7092eee5853dd63879323a"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/idleberg/pklenv.git", branch: "main"

  depends_on "go" => :build
  depends_on "pkl"

  def install
    system "go", "build", *std_go_args(
      ldflags: "-s -w -X github.com/idleberg/pklenv/internal/cli.version=#{version}",
    ), "./cmd/pklenv"

    pkgshare.install "schema/PklEnv.pkl"

    generate_completions_from_executable(bin/"pklenv", "completions")
  end

  test do
    assert_equal "pklenv version #{version}", shell_output("#{bin}/pklenv --version").chomp
  end
end
