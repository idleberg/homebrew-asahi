class NsisLsp < Formula
  desc "Opinionated language server for NSIS"
  homepage "https://github.com/idleberg/nsis-lsp"
  url "https://github.com/idleberg/nsis-lsp/archive/refs/tags/v0.5.9.tar.gz"
  sha256 "4c306054c5e9654fc798fcb97893b36b40538e0cb11ddd7e2e6d47943a5659bd"
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
