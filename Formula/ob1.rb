class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.1/ob1-darwin-arm64.tar.gz"
      sha256 "ed9a541d2876e070092955406afab021752d9024015b4f6f2b02f7939b75e2d0"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.1/ob1-darwin-x64.tar.gz"
      sha256 "e4f8a1bbd89a635f315bf3dc0aa729fbfcf853e535f8f1523845eba25a8048b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.1/ob1-linux-arm64.tar.gz"
      sha256 "04a875b3c2691a1fe77656ac35ae2012eb21a0f09e5ceca1b8909f990ef12d98"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.1/ob1-linux-x64.tar.gz"
      sha256 "673df3fd5dafe4d6bd600b9c0841cdc70a558da6ee1a326a906461bba525b7cd"
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
