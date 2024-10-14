install_tiling() {
  if ! command -v yabai &>/dev/null; then
    brew install koekeishiya/formulae/yabai
    brew install koekeishiya/formulae/skhd
    # brew install --cask nikitabobko/tap/aerospace
    echo "✅ installed window tiling manager"
  fi
}

install_grep() {
  if ! command -v grep &>/dev/null; then
    brew install ripgrep
    echo "✅ installed grep for searching"
  fi
}

install_tools() {
  apps=("tmux" "eza" "bat" "fd" "kitty")

  for app in "${apps[@]}"; do
    if ! command -v "$app" &>/dev/null; then
      brew install --cask "$app"
      echo "✅ Installed $app successfully"
    fi
  done
}

install_tiling
install_tools
