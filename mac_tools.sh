install_grep() {
  if ! command -v grep &>/dev/null; then
    brew install ripgrep
    echo "✅ installed grep for searching"
  fi
}

install_tools() {
  apps=("tmux" "eza" "bat" "fd" "kitty" "nvim")

  for app in "${apps[@]}"; do
    if ! command -v "$app" &>/dev/null; then
      brew install --cask "$app"
      echo "✅ Installed $app successfully"
    fi
  done
}

install_grep
install_tools
