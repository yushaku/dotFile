install_grep() {
  if ! command -v grep &>/dev/null; then
    brew install ripgrep
    echo "✅ installed grep for searching"
  fi
}

install_tools() {
  apps=("tmux" "eza" "bat" "fd" "nvim")

  for app in "${apps[@]}"; do
    if ! command -v "$app" &>/dev/null; then
      brew install "$app"
      echo "✅ Installed $app successfully"
    fi
  done
}

install_grep
install_tools
