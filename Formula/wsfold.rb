class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.5/wsfold_Darwin_arm64.tar.gz"
      sha256 "106c15be80c8e2c9a3f2fd4d8d96f05ad0322787746b65377996ae1c3e44e5b4"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.5/wsfold_Darwin_x86_64.tar.gz"
      sha256 "08a971578057e3477e69fe696773980ae9d783255bdc5fa5bcfee492ceb0cc0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.5/wsfold_Linux_arm64.tar.gz"
      sha256 "dc25296e60313149b7abbff2b652e0d7f77e52b1bb973e3020ad7c3bb5604053"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.5/wsfold_Linux_x86_64.tar.gz"
      sha256 "06ba9e13fdd44dd6690fcd678fd42b6843c248606ce4c301a1c49d3ad69b073d"
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
