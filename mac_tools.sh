# search engine
install_grep() {
  if ! command -v grep &>/dev/null; then
    brew install ripgrep
    echo "✅ installed grep for searching"
  fi
}

# warp -  AI terminal
# cursor - AI code editer
install_cask_tools() {
  apps=("warp" "cursor")

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
# bun      - brew install oven-sh/bun/bun

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
install_tools
install_cask_tools
