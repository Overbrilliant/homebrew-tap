class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.2.0/ob1-darwin-arm64.tar.gz"
      sha256 "c9b271b8b7cde760f5d9e60f7e6fbf2633e6b8f0e63fba6a27b21776d6c54291"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.2.0/ob1-darwin-x64.tar.gz"
      sha256 "c894677eb08fa6506aade037d199dc6b71bdbb8c904c6d80d1d1e8054fc681f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.2.0/ob1-linux-arm64.tar.gz"
      sha256 "c7d88c4a4ca6523d288d6db7b7a2fd5fb2e6326bd435c2ca7eb62aca75e5b85a"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.2.0/ob1-linux-x64.tar.gz"
      sha256 "6d6cd83da5e49a78678c2eb976023f07d4c4eafa81067ee05767a9e41614eb84"
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
