class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.15/ob1-darwin-arm64.tar.gz"
      sha256 "fa776e59b920cde28fca3838409334af76709d7f46ec4395b8615f68c2cf2061"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.15/ob1-darwin-x64.tar.gz"
      sha256 "913bcef7511f43eb2b6a6f4d5faea69806dfce5bb654b4f4f55fbb3eaf52620e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.15/ob1-linux-arm64.tar.gz"
      sha256 "14dfe805ec836764d4b6499aa4ac97ed3530f17d4f8e4bd03664d0293b941045"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.15/ob1-linux-x64.tar.gz"
      sha256 "f1b7d9d186fa97a2a6e4c46516d8843e2e8e837abf07f2909735818395db8a5e"
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
