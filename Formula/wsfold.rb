class Wsfold < Formula
  desc "Workspace composition CLI for trusted multi-repo development"
  homepage "https://github.com/wsfold/wsfold"
  version "0.0.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.4/wsfold_Darwin_arm64.tar.gz"
      sha256 "d5563743b6b37de90e7531b07db6694a7aef36b87e655584a98d315e2cf3ad6c"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.4/wsfold_Darwin_x86_64.tar.gz"
      sha256 "c52ecb8673dfbe32ea995af423cdaef9ad0d7292ae2ec368b07c94f736935ed7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.4/wsfold_Linux_arm64.tar.gz"
      sha256 "0d703da200ec836c88901f7fe6bf65925845db71b9a93652dc87677b5c4c2170"
    else
      url "https://github.com/wsfold/wsfold/releases/download/v0.0.4/wsfold_Linux_x86_64.tar.gz"
      sha256 "efd9cbe54c5f2e0dd3d104c4f4d79ff61f7a1b534e231f479cf33f1685569309"
    end
  end

  def install
    bin.install "wsfold"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/wsfold --help")
  end
end
