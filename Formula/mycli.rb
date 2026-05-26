class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.0.29.tar.gz"
  sha256 "8af3ca11e98393e5c28907d84be2a108c5fe07a32de308bd1777654e09f4d213"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X mycli.sh/cli/internal/config.DefaultAPIURL=https://api.mycli.sh -X mycli.sh/cli/internal/client.Version=#{version} -X mycli.sh/cli/internal/client.InstallMethod=brew"), "-o", bin/"my", "./cli/cmd/my"

    generate_completions_from_executable(bin/"my", "completion")
  end

  test do
    system bin/"my", "--help"
  end
end
