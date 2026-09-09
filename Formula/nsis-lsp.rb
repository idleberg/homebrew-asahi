class NsisLsp < Formula
  desc "Opinionated language server for NSIS"
  homepage "https://github.com/idleberg/nsis-lsp"
  url "https://github.com/idleberg/nsis-lsp/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "3f4df3fa13a1a643a0a16ed39c199106c0d7fff4ab56ba4c8bd95dfbb5f0dee5"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/idleberg/nsis-lsp.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    init = { jsonrpc: "2.0", id: 1, method: "initialize", params: { rootUri: nil, capabilities: {} } }
    shutdown = { jsonrpc: "2.0", id: 2, method: "shutdown" }
    exit_msg = { jsonrpc: "2.0", method: "exit" }

    input = [init, shutdown, exit_msg].map do |msg|
      json = msg.to_json
      "Content-Length: #{json.size}\r\n\r\n#{json}"
    end.join

    output = pipe_output(bin/"nsis-lsp", input)
    assert_match "completionProvider", output
  end
end
