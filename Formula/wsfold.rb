class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "f04f6d5c398f16354b960e45913904b68d724101a830c82f50de9f25bd4c540a"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "ae1175857181e1a912ae75ab732556af15342f5d3ec9a9250b8ac0ab7d93a684"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.1/wsfold_Linux_arm64.tar.gz"
      sha256 "a71c88dd557d27716df717d55dea6619dd90eb37d1e3c880eeefc88c0b7c9248"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.1.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "681ebf0c7e085a710033343ef48058cad0756c27d4be0d8a12ce178618be0b81"
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
