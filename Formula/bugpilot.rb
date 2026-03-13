# Homebrew formula for the BugPilot CLI.
class Bugpilot < Formula
  desc     "CLI-first developer tool for debugging production incidents"
  homepage "https://bugpilot.io"
  version  "0.3.0"
  license  "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-arm64"
      sha256 "78aa9f587f36f2c15bfa49043ca19764aa59c39a073dcf3cb752c15c38d9fccc"
    end
    on_intel do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-x86_64"
      sha256 "3d1c4607f6ab1afa23541fdd92dd9dedf4a36a82e5550d72d78247a601bee91a"
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
