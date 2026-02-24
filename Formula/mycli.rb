class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "8468d9108a220070213f26155a9f066269b1dc8cb65314fd820e70e26865c3f2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X mycli.sh/cli/internal/config.DefaultAPIURL=https://api.mycli.sh"), "-o", bin/"my", "./cli/cmd/my"
  end

  test do
    system bin/"my", "--help"
  end
end
