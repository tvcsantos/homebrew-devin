# typed: false
# frozen_string_literal: true

class Devin < Formula
  desc "Command-line coding agent powered by Devin's intelligence"
  homepage "https://cli.devin.ai"
  version "3000.13.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "24b52c2bb312f8ab3d71545a173a69446901b27da5a44300bd03464ab066525b"
    end
    on_intel do
      url "https://static.devin.ai/cli/#{version}/devin-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0e10437b40064dca09295d3d1f174ff4934aee9c98c54b833e55fa9841cf3598"
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
