class Ob1 < Formula
  desc "CLI coding agent for Overbrilliant"
  homepage "https://github.com/Overbrilliant/ob-1"
  version "0.3.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.13/ob1-darwin-arm64.tar.gz"
      sha256 "0b463f886dd6f03d9a50e9dee849e9b0b19a2689b82b558c4bc382a53393995e"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.13/ob1-darwin-x64.tar.gz"
      sha256 "dc365cd9ed35f41a9202749b811e730edbc5beaff41e38e76f3a480213e91e53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.13/ob1-linux-arm64.tar.gz"
      sha256 "4f5b8e0f43120527df938c668ac67b634f2b4897dd046413e81829e823d18f6c"
    else
      url "https://github.com/Overbrilliant/ob-1/releases/download/v0.3.13/ob1-linux-x64.tar.gz"
      sha256 "ce821ee74d0b705ffbb15c477b1e393782b52bd68cb085e79032a96ad0ff0f4f"
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
