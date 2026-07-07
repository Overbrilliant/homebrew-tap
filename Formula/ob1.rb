class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.4/ob1-darwin-arm64.tar.gz"
      sha256 "390f79238874f29b316cccdbf18c3ef943645163fff1905e0f1533daa85f2706"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.4/ob1-darwin-x64.tar.gz"
      sha256 "4d3d42f02bc8472333c59acb5b222973bcb142fafea25cfbfdc2bd8b91747720"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.4/ob1-linux-arm64.tar.gz"
      sha256 "49ac2307c0c213ff7093783059e07fa74dc51022f1cb739f8971e2d51b1f5af3"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.4/ob1-linux-x64.tar.gz"
      sha256 "da445d1edd691ea8eac094586ddf783d986f58119bf91c28af5f4a96b935c125"
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
