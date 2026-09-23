class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.11/ob1-darwin-arm64.tar.gz"
      sha256 "c26d60f32b99d6858e6489501412677d674d6f1217794474da693675a0a2ffe8"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.11/ob1-darwin-x64.tar.gz"
      sha256 "f9c1f836b320d60c20424ec0ccea17da3a8c4b6ac47918bdaf30311519caebfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.11/ob1-linux-arm64.tar.gz"
      sha256 "17458ac69f3cb8441668efd4ab7ff79a40320db905d1fa3f99b542ef727275a2"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.11/ob1-linux-x64.tar.gz"
      sha256 "fc93123e1a4940e9b2b90d7089f5b4070ef4f2c5d85bacf2e7a1f4365efc4880"
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
