class Mycli < Formula
  desc "CLI tool for defining, publishing, and running shell-based command specs"
  homepage "https://mycli.sh"
  url "https://github.com/mycli-sh/mycli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "56809fe046a5261f28b8c6520c4d81b11a628ec4bdc349913628f1a43bfbd47c"
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
