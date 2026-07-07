class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.7/ob1-darwin-arm64.tar.gz"
      sha256 "a8eaf828a7064c3394a3f74b4b975cd8fd82db3232e467cec34bcbd3b4092ced"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.7/ob1-darwin-x64.tar.gz"
      sha256 "3830734a650ff2475d2f43ea1270b934dd6b1a82887c8eb354b21b9e69fcabd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.7/ob1-linux-arm64.tar.gz"
      sha256 "644dd2abf1d01e8be160949957a8dee6cc9d14280861f3b99b9dfd94234b816d"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.7/ob1-linux-x64.tar.gz"
      sha256 "6300291d33f22ca8e872cbb1ca5c253b9ba9e0b1ca9d2d317033d040d2a13ab5"
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
