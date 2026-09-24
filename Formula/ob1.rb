class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.12/ob1-darwin-arm64.tar.gz"
      sha256 "4545b66215d46d579160e284ae5da03144ba88c0586fbfd7291f7eef73b302ef"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.12/ob1-darwin-x64.tar.gz"
      sha256 "406930000c946cd58eb057fc633de4f160ef47955c06da55e1fcf384e30fb1f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.12/ob1-linux-arm64.tar.gz"
      sha256 "e55e6a1fa5d6981f684194387119eeae7fcf548838bda7c7596054109656b794"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.12/ob1-linux-x64.tar.gz"
      sha256 "4ac3fe0bb3378ebacd284f3b9da6640a14800a1f6a976f8e4320e8f5bd99c71c"
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
