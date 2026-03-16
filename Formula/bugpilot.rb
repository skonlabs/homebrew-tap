class Bugpilot < Formula
  desc     "CLI-first developer tool for debugging production incidents"
  homepage "https://bugpilot.io"
  version  "0.4.0"
  license  "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-arm64"
      sha256 "f244590aa3538479a47ef9a4a2ca44e1f87e7d92cfcb7cc82370318decf3fab8"
    end
    on_intel do
      url "https://github.com/skonlabs/bugpilot/releases/download/v#{version}/bugpilot-macos-amd64"
      sha256 "0e7fec1d889c7ff3cfc554b993c6fdf4bbe404980fa274d5cae10b702929d30b"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "bugpilot-macos-amd64" => "bugpilot"
    else
      bin.install "bugpilot-macos-arm64" => "bugpilot"
    end
  end

  test do
    system "#{bin}/bugpilot", "--version"
  end
end
