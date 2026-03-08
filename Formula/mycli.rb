class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.0.22.tar.gz"
  sha256 "48fc52bca7bcd7f5960ac82113209f24bf3be2b20418e54e0ea4617aa3f73146"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X mycli.sh/cli/internal/config.DefaultAPIURL=https://api.mycli.sh -X mycli.sh/cli/internal/client.Version=#{version}"), "-o", bin/"my", "./cli/cmd/my"

    generate_completions_from_executable(bin/"my", "completion")
  end

  test do
    system bin/"my", "--help"
  end
end
