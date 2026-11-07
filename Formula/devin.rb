# typed: false
# frozen_string_literal: true

class Devin < Formula
  desc "Command-line coding agent powered by Devin's intelligence"
  homepage "https://cli.devin.ai"
  version "3000.12.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7331731afa01db2c4848b9435e395e4bda534db4b100c188a7efe95173e6ccac"
    end
    on_intel do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c854806bc12fc4b0969e21209f858cb4a6c580bfafcff062235a1db9031c2d5f"
    end
  end

  def install
    bin.install "bin/devin"
    man1.install Dir["share/man/man1/*.1"]
    pkgshare.install "share/devin/docs" if (buildpath/"share/devin/docs").exist?

    # Write distribution marker so the Devin updater knows this was
    # installed via Homebrew and defers upgrades to `brew upgrade`.
    (prefix/"distribution").write "homebrew\n"
  end

  def caveats
    <<~EOS
      To complete the installation, run:
        devin setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devin --version")
  end
end
