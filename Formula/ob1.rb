class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.0/ob1-darwin-arm64.tar.gz"
      sha256 "cb8cfec87cc170297fef80e2b09f4d76a254bc0a2f5286f55a7fd3026364b47d"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.0/ob1-darwin-x64.tar.gz"
      sha256 "e0ef2103b3ab6921c6029f699a5a74869539caa0bfaf7bd73f34b9f7eee01073"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.0/ob1-linux-arm64.tar.gz"
      sha256 "77c7e286ed1319bcd58f466d7c1da5f61561b80e617b7dcfcdd51b0702c528ec"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.0/ob1-linux-x64.tar.gz"
      sha256 "8990872ae8201e68b9cbb203b47a78cc4d1b380f3bacf45745bff3ffdcb1699d"
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
