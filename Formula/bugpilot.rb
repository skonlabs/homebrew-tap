# Homebrew formula for the BugPilot CLI.
class Bugpilot < Formula
  desc     "CLI-first developer tool for debugging production incidents"
  homepage "https://bugpilot.io"
  version  "0.3.0"
  license  "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-arm64"
      sha256 "488222bff935b6099633a384ff20ac524662658df6b1ea2f0b771d94de0d6748"
    end
    on_intel do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-x86_64"
      sha256 "61bcb6f3666273c727336424a49aaad829cdc3b1db65f4f8e1bb9b1cbc67ef9d"
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
