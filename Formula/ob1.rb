class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.5/ob1-darwin-arm64.tar.gz"
      sha256 "dc31c5d2db206f3f95a3d383544e6998b2b37f7c64af7d28ec8462b537dba86e"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.5/ob1-darwin-x64.tar.gz"
      sha256 "b9056a69c5466cfd35cf63ccf5e39b0baa9e12f4037b8e4afc742656861bd266"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.5/ob1-linux-arm64.tar.gz"
      sha256 "0cfd577feefb42c6ad442df268e69864a29591c3c2a4411f26b090ac6e6ebdde"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.5/ob1-linux-x64.tar.gz"
      sha256 "a5cbf935b878cef8a04afad13fb7606269053e1db6fe13b9fcf2b5d8edc99979"
    end
  end

  def install
    bin.install "ob1"
  end

  test do
    ENV["HOME"] = testpath/"home"
    ENV["OB1_SETTINGS_DIR"] = testpath/"settings"
    assert_match version.to_s, shell_output("#{bin}/ob1 --version")
    assert_match "bye", pipe_output("#{bin}/ob1", "/exit\n", 0)
  end
end
