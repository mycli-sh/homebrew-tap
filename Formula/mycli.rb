class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.0.17.tar.gz"
  sha256 "a496ac146d994d747bd9acab3e9a335d4ce8b9743fd6c4f639eb3064272687b8"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X mycli.sh/cli/internal/config.DefaultAPIURL=https://api.mycli.sh -X mycli.sh/cli/internal/client.Version=#{version}"), "-o", bin/"my", "./cli/cmd/my"
  end

  test do
    system bin/"my", "--help"
  end
end
