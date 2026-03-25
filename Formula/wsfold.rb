class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "3eec2d56ca0b83da0b1ba09d27d93d8c90537812edee4d873bcca719c9e71d2a"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "a1309fd58af478bc05a8982427cf3b7322d38a7e321b1908bee01fdf1f17cb24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.0/wsfold_Linux_arm64.tar.gz"
      sha256 "6f725c40a649315f3c183a9bc330a64045b5e0afe1d7080087beaa88c7754051"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "1aa9a1ce396c424e9911f1e761a2b7290e591c39d3d3f57aff4f236ce6b6770c"
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
