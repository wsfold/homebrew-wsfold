class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "7aba027505a8ea5a14a3c3db5c3b5580e44a9198779d4dda5e61d6f51c3d569e"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "ee3e47855e5cc1b32e495504bf9487550ec68da206ede022ea57d5959656275e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Linux_arm64.tar.gz"
      sha256 "67e3f1c8ed56ff6773d08f22af8e4263fbf87ee270fe95bccf9386f277981892"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "663a3d1d58f6c2cf828b0f34fcb01ea40a950e23818716de96960d323225090a"
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
