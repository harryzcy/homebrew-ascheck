class Ascheck < Formula
  desc "Command-line app that checks all of your apps for their Apple Silicon support"
  homepage "https://github.com/harryzcy/ascheck"
  url "https://github.com/harryzcy/ascheck/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "eb0cbf673d9fd696128b758f598fbb44ddc5b5a82626de2454ab1a4959e14855"
  license "MIT"
  head "https://github.com/harryzcy/ascheck.git"

  bottle do
    root_url "https://github.com/harryzcy/homebrew-ascheck/releases/download/ascheck-0.1.0"
    sha256 cellar: :any_skip_relocation, catalina:     "a07e726755eeae1f20d4d260136bbfcece797434c42b719a898960159052187d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cf79900fe888b4ab446dcf1b7fe09ef71608b76d594eac7a55dc7d11b4899707"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    assert_match(/NAME/, shell_output("#{bin}/ascheck"))
  end
end
