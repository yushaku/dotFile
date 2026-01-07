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
install_cask_tools() {
  apps=("warp" "cursor" "raycast")

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
# fnm      - node version manager
# pnpm     - node package manager
install_tools() {
  apps=("eza" "bat" "fd" "nvim" "orbstack" "git" "fnm" "pnpm")

  for app in "${apps[@]}"; do
    if ! command -v "$app" &>/dev/null; then
      brew install "$app"
      echo "✅ Installed $app successfully"
    fi
  done
}

install_grep
install_bun
install_cask_tools
install_mole
install_tools
