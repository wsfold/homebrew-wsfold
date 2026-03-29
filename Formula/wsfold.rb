class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "de343f951788ce2e6b0031af9130192f973b7ca69e497acecd447ae45fb8c561"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "ace22efc58124bd48ac89a43804cbcedb7e41f2dacc3223794d08adee344ecd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Linux_arm64.tar.gz"
      sha256 "8076994e34cb6c859455f1d0fe4bfc2542b211031c49d4e0982db2a16a6abf50"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.4.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "15e2b7483b0ef55aa706f1dfa2ac3c1701f0f06cb7dac8234c7bef41781077c6"
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
