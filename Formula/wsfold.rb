class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.2.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "7afae65424539f786974fa5f33735d78c5bc4493786e9d8d3038ff73b0432692"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.2.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "26a8ab957be1c7a2b68d0e4198e92eb999c154a5d6950019ec4f64104151ec2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.2.0/wsfold_Linux_arm64.tar.gz"
      sha256 "891089ac48dfbb2ac917d4e2fe3b2428d650517183f8bf6e75036dac52ce868b"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.2.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "6a3a886ba840c77806e3f2c2ce7b5f5852597f6f5d5f0413c74979b7d140458d"
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
