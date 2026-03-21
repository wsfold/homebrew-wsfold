class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.0.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.6/wsfold_Darwin_arm64.tar.gz"
      sha256 "9284f0cb02f0bee2673970ea31e638c824de8b8f626681d5a3674b80189f162a"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.6/wsfold_Darwin_x86_64.tar.gz"
      sha256 "8ac451531fcc1a38aa0d76f82c2fc90e1e2879518cf70a88a7b0683de8795912"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.6/wsfold_Linux_arm64.tar.gz"
      sha256 "2dafabcf24d21dec1ca8465cd5e87ce881d9aa4e75dffc30b437791c0fe45151"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.6/wsfold_Linux_x86_64.tar.gz"
      sha256 "8ca4232e0b0cdf51ce8b56e7e67c1f8552eca2ef7d717ca5cf06a0376f070574"
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
