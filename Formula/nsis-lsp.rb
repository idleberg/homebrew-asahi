class NsisLsp < Formula
  desc "Opinionated language server for NSIS"
  homepage "https://github.com/idleberg/nsis-lsp"
  url "https://github.com/idleberg/nsis-lsp/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "9fbc5e55e87fd07becc188676a76e060b6d690481b2e926a94e2d3d94d6c0b2a"
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
