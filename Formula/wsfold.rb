class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.3.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "70de80f5423b082d45c3a5a5b87b2287faacb0b1ef3eb58c375e2ac08bf54cc8"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.3.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "52e0e3e28ca207a67339758ec6846991b0967f30eeb89a36573ee2c94bbb4697"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.3.0/wsfold_Linux_arm64.tar.gz"
      sha256 "de507a1fb149082447e68879c3d4ae254983eae796d37cd1e65543853cee2e35"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.3.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "f83d89ffd242d1767e44b0204ce731b0cf0ce717f936df554486625f26141298"
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
