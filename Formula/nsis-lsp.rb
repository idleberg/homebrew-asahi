class NsisLsp < Formula
  desc "Opinionated language server for NSIS"
  homepage "https://github.com/idleberg/nsis-lsp"
  url "https://github.com/idleberg/nsis-lsp/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "33f09cd0d5e2012c8e8de9fe68cdd89b56e7f0b5ede04bcb4c91be7a52807fc9"
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
