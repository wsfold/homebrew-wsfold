class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.1/wsfold_Darwin_arm64.tar.gz"
      sha256 "956b9e1b39fc1dc265ec9300dd4ec5192bee78b538b27a0b8e456657f1276f52"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.1/wsfold_Darwin_x86_64.tar.gz"
      sha256 "d3cd8576a57be251a53176f1524c2a64c9f6e11fa5b95d506c5d718b94e6e067"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.1/wsfold_Linux_arm64.tar.gz"
      sha256 "09aa0ba4d70c1fbf2e5f5a7d17de3ace93d2c540642a9c2af6d0d73604eab2ce"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.1/wsfold_Linux_x86_64.tar.gz"
      sha256 "dc9b9b6950554f37d88e039ef0f62c77f2eca633888440350e17c5bd114d7463"
    end
  end

  def install
    bin.install "wsfold"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wsfold --help")
  end
end
