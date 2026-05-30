class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/atilarum/wsfold"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "e3c92d316eb3d90eef6b40506c430f2cc439b57c04106fb2481ecfb9d9cb8f12"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "19a4093ad78416c997dfd3f73f323d9a4d655c09fb3637a5457d80f70e9198a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.1/wsfold_Linux_arm64.tar.gz"
      sha256 "374d652ce1a2e5fd28b421ceb7b691c4426c56069f72412463f98c9951041d25"
    else
      url "https://github.com/atilarum/wsfold/releases/download/v0.8.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "42b584b1a689a1a79afe734dc5844be01bd1b6a261b26a0adaf04a323afdd837"
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
