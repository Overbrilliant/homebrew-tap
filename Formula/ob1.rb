class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.2/ob1-darwin-arm64.tar.gz"
      sha256 "dc5b5d1a66ff5fbbfbc663c0504dd13539e2741478bd1b62168d3958f3fb23a6"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.2/ob1-darwin-x64.tar.gz"
      sha256 "c0ecf4b9c15590c9a7de2f2fbebdc9545865e03203f32b3569cbd58472bb8375"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.2/ob1-linux-arm64.tar.gz"
      sha256 "ec164c22e42e0d5092adf4b30d08b0d7b5bc97f398287b91f5e81a4dcab12ec3"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.2/ob1-linux-x64.tar.gz"
      sha256 "a7a1a47ed90a8cfe3a5647f3c37ea4bd753af0b85c413313156549c3712f0356"
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
