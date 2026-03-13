# Homebrew formula for the BugPilot CLI.
#
# This file lives in a Homebrew tap repo (e.g. skonlabs/homebrew-tap).
# Users install with:
#   brew tap skonlabs/tap
#   brew install bugpilot
#
# To update after a release:
#   1. Download the new macOS arm64 binary from the GitHub Release.
#   2. Compute sha256: shasum -a 256 bugpilot-macos-arm64
#   3. Update the sha256 field below.
#   4. Bump `version`.
#   5. Commit and push to the tap repo.

class Bugpilot < Formula
  desc     "CLI-first developer tool for debugging production incidents"
  homepage "https://bugpilot.io"
  version  "0.3.0"
  license  "Proprietary"

  on_arm do
    on_macos do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-arm64"
      sha256 "a387a0a7804910fa8470a9fe8ba5c5c648498813f3ae8f272fa9a7c5a74dff22"
    end
  end

  def install
    bin.install "bugpilot-macos-arm64" => "bugpilot"
  end

  def caveats
    <<~EOS
      Shell completions are not installed automatically.
      To enable them, add one of the following to your shell profile:

        # bash (~/.bash_profile or ~/.bashrc)
        eval "$(bugpilot --completion bash)"

        # zsh (~/.zshrc)
        eval "$(bugpilot --completion zsh)"

        # fish (~/.config/fish/config.fish)
        bugpilot --completion fish | source
    EOS
  end

  test do
    system "#{bin}/bugpilot", "--version"
  end
end
