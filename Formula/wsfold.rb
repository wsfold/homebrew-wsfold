class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.9.0/wsfold_Darwin_arm64.tar.gz"
      sha256 "7a9c59dc487b906221fa38aab3e3cf42369ad285cb335151587150b968f26e96"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.9.0/wsfold_Darwin_x86_64.tar.gz"
      sha256 "be8bd667c70593d6f40fd7134cb9b426b0bde46f3e4eee48c9ba752036c5eb57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.9.0/wsfold_Linux_arm64.tar.gz"
      sha256 "2bd9f0136b4c2046c9b45d52720144248ad81a242ee0a2d4767ce0cdeaa409ae"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.9.0/wsfold_Linux_x86_64.tar.gz"
      sha256 "ab432e7d600136cb87c28185ad823ae7a1ecef86f2bf25a0f74bb6ec34f61eaf"
    end
  end

  def install
    bin.install "wsfold"

    generate_completions_from_executable(bin/"wsfold", "completion", shells: [:zsh])
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
