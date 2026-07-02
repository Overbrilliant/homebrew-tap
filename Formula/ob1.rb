class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.4/ob1-darwin-arm64.tar.gz"
      sha256 "4ffd5afdec8a118182be01db319bf71e1fe0a1315d8cc8d6c9e8b61087fe9b09"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.4/ob1-darwin-x64.tar.gz"
      sha256 "e0b45a3d7dae879efd6d97bfde2c1f9251cee3e2f2d22b7c54536bd6538425a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.4/ob1-linux-arm64.tar.gz"
      sha256 "40ce29b2703786a2d7fb0b05fbfae9504d63c167942578b377e9153d23b81bda"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.1.4/ob1-linux-x64.tar.gz"
      sha256 "cce0920f45ba4044222158178d50f2f1a2a696a144def082d3211e4fd4573a0a"
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
