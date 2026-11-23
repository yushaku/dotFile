#!/bin/bash

install_homebrew() {
  if command -v brew &>/dev/null; then
    echo "✅ Homebrew already installed, skipping"
    return 0
  fi

  echo "📦 Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  if command -v brew &>/dev/null; then
    echo "✅ installed Homebrew"
  else
    echo "❌ Homebrew install failed" >&2
    return 1
  fi
}

# search engine for CLI
install_grep() {
  if ! command -v grep &>/dev/null; then
    brew install ripgrep
    echo "✅ installed grep for searching"
  fi
}

#Bun is an all-in-one toolkit for developing modern JavaScript/TypeScript applications.
install_bun() {
  if ! command -v bun &>/dev/null; then
    brew install oven-sh/bun/bun
    echo "✅ installed bun"
  fi
}

# All-in-one toolkit equal to CleanMyMac + AppCleaner + DaisyDisk + Sensei + iStat in one trusted binary
install_mole() {
  if ! command -v mo &>/dev/null; then
    brew install tw93/tap/mole
    echo "✅ installed mole"
  fi
}

# warp    - AI terminal
# cursor  - AI code editer
# raycast - Spotlight for mac but better
# ghostty - Normal terminal
install_cask_tools() {
  apps=("cursor" "ghostty")

  for app in "${apps[@]}"; do
    if ! command -v "$app" &>/dev/null; then
      brew install --cask "$app"
      echo "✅ Installed $app successfully"
    fi
  done
}

# eza      - like ls but more colorful
# bat      - like cat but better
# fd       - A simple, fast and user-friendly alternative to find.
# orbstack - docker desktop but better
# starship - shell prompt
# fnm      - node version manager
# pnpm     - node package manager
# mac-mouse-fix - fix mouse acceleration
# gonhanh - vietnamese keyboard supporter
install_tools() {
  apps=("eza" "bat" "fd" "nvim" "orbstack" "git" "starship" "fnm" "pnpm")

  for app in "${apps[@]}"; do
    if ! command -v "$app" &>/dev/null; then
      brew install "$app"
      echo "✅ Installed $app successfully"
    fi
  done
}

install_homebrew || exit 1
install_grep
install_bun
install_cask_tools
install_mole
install_tools
