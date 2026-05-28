# typed: false
# frozen_string_literal: true

class Devin < Formula
  desc "Command-line coding agent powered by Devin's intelligence"
  homepage "https://cli.devin.ai"
  version "2026.5.26-2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d4c44501664a3c231f126d733c60c7068ab8cc0617b0819396b5f04e4647f5cd"
    end
    on_intel do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0772ec9cb5f21314da8150bb5226ec413c64e6ee8a998ce0af62ed0097a64b2a"
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
