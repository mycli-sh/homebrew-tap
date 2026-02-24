class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "936c7a83ffd7bdc19df04f0bcaf0c3f14e185444bb95469099fd9c52c962b16f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X mycli.sh/cli/internal/config.DefaultAPIURL=https://api.mycli.sh"), "-o", bin/"my", "./cli/cmd/my"
  end

  test do
    system bin/"my", "--help"
  end
end
