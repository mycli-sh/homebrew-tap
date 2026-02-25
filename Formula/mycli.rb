class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "81435285780ff3070f06ff95c96dacfdbf49d030c8508c406b148341f72b37d8"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X mycli.sh/cli/internal/config.DefaultAPIURL=https://api.mycli.sh"), "-o", bin/"my", "./cli/cmd/my"
  end

  test do
    system bin/"my", "--help"
  end
end
