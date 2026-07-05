class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.5/ob1-darwin-arm64.tar.gz"
      sha256 "ccb0d43bcebcbfa4ec2585508453857800fb96004ea599965b4318536a80c583"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.5/ob1-darwin-x64.tar.gz"
      sha256 "496fd3bb3490b581629b8dfdf14d40b1ae9e92438d07efe3e9a519a091b4cf22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.5/ob1-linux-arm64.tar.gz"
      sha256 "61c21b2fb4b5e61b071429603484f32e874b3de65e2acc766a7db01779e550f4"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.5/ob1-linux-x64.tar.gz"
      sha256 "a1bae2b18c61580eab9463d668ef4c385b22392f1fb105af95b6ed58b99a465c"
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
