class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.9/ob1-darwin-arm64.tar.gz"
      sha256 "36273919d8d377bde7a18570eb6694857b5374e752235424a6af6d62dc06f835"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.9/ob1-darwin-x64.tar.gz"
      sha256 "7a3323f4a52badd9bbe8b6548d48a593276154dadf5ab2a036a0c014d2a95c4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.9/ob1-linux-arm64.tar.gz"
      sha256 "43be04c0119cc6f4d821460a194949ac61b6b61005c277db1cac9924d994bec6"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.9/ob1-linux-x64.tar.gz"
      sha256 "efa4744fc0f32c237d86f9b680c089bd7358ad1668cfe37c465724c735c4338b"
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
