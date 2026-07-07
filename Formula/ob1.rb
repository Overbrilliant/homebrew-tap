class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.3/ob1-darwin-arm64.tar.gz"
      sha256 "0040733d04460405e091eeb2db9b3855ce3f673fe074bb36ced909ac9da1a0d4"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.3/ob1-darwin-x64.tar.gz"
      sha256 "0a0d23f6832377146dbcd1417356d7467d687f02cb7be9be80ff0b26aefe4d6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.3/ob1-linux-arm64.tar.gz"
      sha256 "bbcc8df3f403acd34c24396e3c518161419329dbbb4e9ef777be0e37848745ed"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.3/ob1-linux-x64.tar.gz"
      sha256 "3679cbc5c4008ce3cc563928353663f5faf9c6612577772224a879a009d211f2"
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
