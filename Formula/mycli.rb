class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "04528989d036646fa2cd356b9bd08ec7a67fd8627e77a4ff591287d022a14b52"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"my", "./cli/cmd/my"
  end

  test do
    system bin/"my", "--help"
  end
end
