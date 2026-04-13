# typed: false
# frozen_string_literal: true

class Devin < Formula
  desc "Command-line coding agent powered by Devin's intelligence"
  homepage "https://cli.devin.ai"
  version "2026.4.9-0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ea1f56748b6178affce631d72bfbde0022e15a3bdb72e29394e1646a94298f3e"
    end
    on_intel do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "11bf80939a635f0347e10230efa698cfc0d8916eb9a7e007bc6371fb4cc9903e"
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
