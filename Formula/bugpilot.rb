# Homebrew formula for the BugPilot CLI.
class Bugpilot < Formula
  desc     "CLI-first developer tool for debugging production incidents"
  homepage "https://bugpilot.io"
  version  "0.3.0"
  license  "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-arm64"
      sha256 "e53e09b307720844e2a1fb7a7857d2c315bdd1152d5adb70b546f56c168fd60e"
    end
    on_intel do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-x86_64"
      sha256 "6586f9a155b3197693c5cb3d8d5064b0212dc5bde3b8602833432ef1dbd463dc"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "bugpilot-macos-x86_64" => "bugpilot"
    else
      bin.install "bugpilot-macos-arm64" => "bugpilot"
    end
  end

  def caveats
    <<~EOS
      Shell completions are not installed automatically.
      To enable them, add one of the following to your shell profile:

        # bash (~/.bash_profile or ~/.bashrc)
        eval "\"

        # zsh (~/.zshrc)
        eval "\"

        # fish (~/.config/fish/config.fish)
        bugpilot --completion fish | source
    EOS
  end

  test do
    system "#{bin}/bugpilot", "--version"
  end
end
