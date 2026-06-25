class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.1/ob1-darwin-arm64.tar.gz"
      sha256 "009236e7d03974479c3f363a9be3e345bf7ee9cdc11fa3b496522a66cd24f6ee"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.1/ob1-darwin-x64.tar.gz"
      sha256 "a7f84e9b7685039074111c28b5b97dcfb70d8ac275ceb384696de8e99906d8c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.1/ob1-linux-arm64.tar.gz"
      sha256 "fb20f2b719d8c813e0a8926e6a9c2c245e1fb381fe8b8eaca7fa75c9973b2bc3"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.1/ob1-linux-x64.tar.gz"
      sha256 "870d562b029d57c00ffcb74643350a58cf3f750c5bf030b2e94004165f58c67a"
    end
  end

  def install
    bin.install "ob1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ob1 --version")
  end
end
