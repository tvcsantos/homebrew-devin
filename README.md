# homebrew-devin

> **Fun fact:** This entire repository — the formula, the CI workflows, this README — was built by [Devin](https://cli.devin.ai) itself. Yes, Devin wrote its own Homebrew installer. If that's not self-service, I don't know what is. 🤖🍺

Homebrew tap for [Devin for Terminal](https://cli.devin.ai) — a command-line coding agent powered by Devin's intelligence.

## Installation

```bash
brew tap tvcsantos/devin
brew install devin
```

After installing, complete the setup:

```bash
devin setup
```

## Upgrading

```bash
brew upgrade devin
```

## Uninstalling

```bash
brew uninstall devin
brew untap tvcsantos/devin
```

## How it works

This tap distributes the official pre-built Devin CLI binaries for macOS (Apple Silicon and Intel). The formula:

- Downloads the platform-specific binary from Devin's CDN
- Verifies the download using SHA-256 checksums
- Installs the `devin` binary, man pages, and documentation

## Auto-update

This repository includes two GitHub Actions workflows for keeping the formula up to date. **Only one should be enabled at a time**:

| Workflow | File | Behavior |
|---|---|---|
| **Option A** | `update-formula-auto-commit.yml` | Commits directly to `main` |
| **Option B** | `update-formula-pr.yml` | Opens a PR for review |

By default, **Option B** runs on a daily schedule. Option A is manual-only (`workflow_dispatch`) but can be switched to a schedule by uncommenting the cron trigger in its workflow file. **Only one workflow should have a schedule at a time** — if you enable Option A's schedule, comment out Option B's.

## License

This tap is licensed under the [MIT License](LICENSE).

This is an unofficial community project and is not affiliated with Cognition AI.
