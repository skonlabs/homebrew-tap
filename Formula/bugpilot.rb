# Homebrew formula for the BugPilot CLI.
class Bugpilot < Formula
  desc     "CLI-first developer tool for debugging production incidents"
  homepage "https://bugpilot.io"
  version  "0.3.0"
  license  "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-arm64"
      sha256 "edb38cf80e3500a54760a219792fbcc37c6f40f9216d23c68f5c16ffce956975"
    end
    on_intel do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-x86_64"
      sha256 "a43b0c18628aad3fce33f0bc2af63555616e12ffcd200d41dae2e448c69ff96a"
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
