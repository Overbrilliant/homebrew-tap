class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.14/ob1-darwin-arm64.tar.gz"
      sha256 "2284680c81c7cbfa001e3207e01390b4572a01a724757c5541d3e3f4634daad5"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.14/ob1-darwin-x64.tar.gz"
      sha256 "3ff820bb306057e4ddc597596c9d71a0655d602601910a0495ee5d9214d55757"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.14/ob1-linux-arm64.tar.gz"
      sha256 "6f80f3911f1d92e1491469bfe8cae78e2314bfd33e017ecf74f0a0b636707b7a"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.14/ob1-linux-x64.tar.gz"
      sha256 "053a4294081c35098ba35ad6530c2fe6522bb497f10c8d8232cb755206a3a9b7"
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
