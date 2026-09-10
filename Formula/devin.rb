# typed: false
# frozen_string_literal: true

class Devin < Formula
  desc "Command-line coding agent powered by Devin's intelligence"
  homepage "https://cli.devin.ai"
  version "3000.10.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c0b97f8197bf3ce895ff14aa19257c511154b49a0a195bba4962acb5e475c68e"
    end
    on_intel do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4725d6b0dbbf6f71d833b5489469dc8b5c4a4f929926f94d500952a4cb7bbad8"
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
