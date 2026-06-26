class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.2/ob1-darwin-arm64.tar.gz"
      sha256 "43e16d48727b7d52159a65034c656114c4acf243867fe320640429d633b3c033"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.2/ob1-darwin-x64.tar.gz"
      sha256 "8e7ab14675ef2aec0c91cda2309fe28ba04a810ad52e0738a357575f609f56e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.2/ob1-linux-arm64.tar.gz"
      sha256 "cca8823a37e41e700a50860ade5311a2237ab3db798c2a75841ee383bbe5f299"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.2/ob1-linux-x64.tar.gz"
      sha256 "19e972cf384be037c86d17b4cf6011d1b04ef91f572d83479bb6b779b1d1c91d"
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
