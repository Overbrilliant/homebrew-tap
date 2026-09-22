class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.10/ob1-darwin-arm64.tar.gz"
      sha256 "b8a837d2a907b290ab7b3cfbbdc6a2ac3f935ac73b65ada8722117c3e61d5417"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.10/ob1-darwin-x64.tar.gz"
      sha256 "89b6d8550b2695186a7e5ffa7058e127b23116d8b0d1779bf90c992e7bb57ffd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.10/ob1-linux-arm64.tar.gz"
      sha256 "e35d36f17f066520d04b43ccf44f5741cd337218de8daf447654767e55838ad3"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.10/ob1-linux-x64.tar.gz"
      sha256 "28e0965b43b35cca7dae8a9819bde0f4486f1369896db3b02bb7d6566a5ac1b5"
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
