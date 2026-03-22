class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "34297509f578ec4fb3d6ed932139274e00bd7eaac9b55d938031c89b69f0c176"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "ff29fe9ecfe0cd61a19c646f49bb160f5c0cae56c7f318ebf1be4ac7721bb4b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.0/wsfold_Linux_arm64.tar.gz"
      sha256 "bf7fa53e758b16002ba5cb790d034525d7808037d7f6e36fd59a9603784ce726"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "aa72c1fe880b0491a30f67f59c2c42f920a2e71409eb63f855d161a748f0a8d5"
    end
  end

  def install
    bin.install "wsfold"

    (zsh_completion/"_wsfold").write Utils.safe_popen_read(bin/"wsfold", "completion", "zsh")
  end

  def caveats
    <<~EOS
      zsh completion has been installed to Homebrew's completion directory.

      If your shell is already configured for Homebrew completions, nothing else is required.

      Otherwise, you can enable wsfold completion manually:

        eval "$(wsfold completion zsh)"

      To persist it in zsh:

        echo 'eval "$(wsfold completion zsh)"' >> ~/.zshrc
        exec zsh
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wsfold --help")
  end
end
