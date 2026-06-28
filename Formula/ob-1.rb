class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.3/ob1-darwin-arm64.tar.gz"
      sha256 "94ce83ececf742622098fd87bdcb94803785dd0730465a34d277179295f2750b"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.3/ob1-darwin-x64.tar.gz"
      sha256 "69454e5816a717374d2e28c3f8ae24a15d58891aeabac90249c0c4c4bb098255"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.3/ob1-linux-arm64.tar.gz"
      sha256 "9f1fc81866ac02b22c019f61df71c655f7a5566d8c9b42c807f17f038509b4c4"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.3/ob1-linux-x64.tar.gz"
      sha256 "a8c1d78385a7be4ab56cb055396191d2705831548c9a39827cf5074e3f97db57"
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
