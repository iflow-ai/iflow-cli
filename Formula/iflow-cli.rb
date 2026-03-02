class IflowCli < Formula
  desc "AI-powered CLI that embeds in your terminal for coding tasks and workflow automation"
  homepage "https://platform.iflow.cn"
  url "https://registry.npmjs.org/@iflow-ai/iflow-cli/-/iflow-cli-0.5.14.tgz"
  sha256 "7d715c3dc611e3134aaa96a1f68467471b2c50c9b04fba093f4bc4b2ad17b599"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "iflow", shell_output("#{bin}/iflow --version 2>&1", 0)
  end
end
