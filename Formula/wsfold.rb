class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.0.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.3/wsfold_Darwin_arm64.tar.gz"
      sha256 "33b209628b939a9cadf2d308e4d113de948a08f10a1be518f37228b7f6d7609b"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.3/wsfold_Darwin_x86_64.tar.gz"
      sha256 "aea195087898fa0a55baf755ca2b8c09d933b85cf3d1526e1b720bb9f5eabc4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.3/wsfold_Linux_arm64.tar.gz"
      sha256 "ffc381b124592f3c6799e905557a08acf20dc25c452ef307415435485fb1921e"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.3/wsfold_Linux_x86_64.tar.gz"
      sha256 "4927dc47e156823a129944c0225863a6af3b4ff27c745f5636454db277a6c1f7"
    end
  end

  def install
    bin.install "wsfold"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wsfold --help")
  end
end
