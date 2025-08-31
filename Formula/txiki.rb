class Txiki < Formula
  desc "Small and powerful JavaScript runtime"
  homepage "https://github.com/saghul/txiki.js"
  url "https://github.com/saghul/txiki.js.git",
      tag:      "v24.12.0",
      revision: "793dd9d8bb1d54726ca4e7af1d951418e199175f"
  sha256 "6ede6d543bffa60afa5fabf64d27a5465054e36505a1cb3ba8307a6fa3dc89c6"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "texinfo" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", "-DCMAKE_POLICY_VERSION_MINIMUM=3.5", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/tjs"
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/tjs --version").chomp
    assert_match "Hello, world!", shell_output("#{bin}/tjs eval \"console.log('Hello, world!')\"")
  end
end
