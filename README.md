# Homebrew Casks

Personal Homebrew casks for macOS applications that are unavailable from
Homebrew Cask or need a pinned version.

## Install

```bash
brew tap qwqw-333/casks
brew install --cask qwqw-333/casks/fireflies
brew install --cask qwqw-333/casks/alt-tab@10.9.0
```

AltTab is pinned to 10.9.0 because later releases changed window and tab
detection. Its automatic updates are disabled by the cask.
