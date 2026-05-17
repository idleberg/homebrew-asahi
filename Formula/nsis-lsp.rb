class NsisLsp < Formula
  desc "Opinionated language server for NSIS"
  homepage "https://github.com/idleberg/nsis-lsp"
  url "https://github.com/idleberg/nsis-lsp/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "4e8932bfe9258945c8c37fb1f7659b3355997d4f3dffb40ac92b348e8b12a2d6"
  license "MIT"
  head "https://github.com/idleberg/nsis-lsp.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    json = <<~JSON
      {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "initialize",
        "params": {
          "rootUri": null,
          "capabilities": {}
        }
      }
    JSON

    input = "Content-Length: #{json.size}\r\n\r\n#{json}"
    output = pipe_output(bin/"nsis-lsp", input)
    assert_match "jsonrpc", output
  end
end
