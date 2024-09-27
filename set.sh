#!/bin/bash

if [[ -z "$1" ]]; then
  # Define the available options
  OPTIONS=("shell" "tmux" "themes" "vim" "warp" "warp_theme" "all")

  # Use fzf to select options, allowing for multiple selections
  SELECTION=$(printf "%s\n" "${OPTIONS[@]}" | fzf --multi --prompt="Select options: ")
else
  SELECTION=$1
fi

if [[ -z "$SELECTION" ]]; then
  echo "No option selected. Please pick one of the following:"
  echo "${OPTIONS[*]}"
  exit 0
fi

function copy_zsh() {
  rm -rf ~/.config/zsh
  cp -R ./shell/config ~/.config/zsh
  cp ./shell/zshrc ~/.zshrc
  echo "👉 copy zsh done"
}

function copy_theme() {
  mkdir -p ~/.poshthemes
  cp -R ./themes/* ~/.poshthemes
  cp -R ./themes/starship.toml ~/.config/starship.toml
  echo "👉 copy theme done"
}

function copy_lazyvim() {
  rm -rf ~/.config/nvim
  cp -rR ./lazyVim ~/.config/nvim
  echo "👉 copy lazyVim done"
}

function copy_tmux() {
  cp -R ./tmux ~/.config/
  echo "👉 copy file config tmux done"
}

function copy_warp() {
  rm -rf ~/.config/warp-terminal/
  cp -R ./warp ~/.config/warp-terminal/
  echo "👉 copy file config warp done"
}

function copy_warp_theme() {
  WARP_THEMES_DIR="$HOME/.local/share/warp-terminal/themes"
  mkdir -p "$WARP_THEMES_DIR"
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_latte.yml
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_frappe.yml
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_macchiato.yml
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_mocha.yml
  echo "👉 copy themes warp done"
}

# Check if "all" was selected, then run all copy functions
if [[ "$SELECTION" == *"all"* ]]; then
  echo "⭐ Setting all configs to system"
  copy_zsh
  copy_theme
  copy_tmux
  copy_lazyvim
  copy_warp
  copy_warp_theme
  exit 0
fi

# Run selected options
for option in $SELECTION; do
  case $option in
  "tmux")
    copy_tmux
    ;;
  "shell")
    copy_zsh
    ;;
  "themes")
    copy_theme
    ;;
  "vim")
    copy_lazyvim
    ;;
  "warp")
    copy_warp
    ;;
  "warp_theme")
    copy_warp_theme
    ;;
  *)
    echo "Unknown option: $option"
    ;;
  esac
done
