#!/bin/bash

if [[ -z "$1" ]]; then
  # Define the available options
  OPTIONS=("zsh" "tmux" "themes" "vim" "warp" "warp_theme" "tiling" "kitty" "all")

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
  cp -R ./zsh/config ~/.config/zsh
  cp ./zsh/zshrc ~/.zshrc
  echo "👉 copy zsh done"
}

function copy_kitty() {
  rm -rf ~/.config/kitty
  cp -R ./kitty/ ~/.config/kitty/
  echo "👉 copy kitty done"
}

function copy_ghostty() {
  rm -rf ~/.config/ghostty/
  cp -R ./ghostty/ ~/.config/ghostty/
  echo "👉 copy ghostty done"
}

function copy_theme() {
  # mkdir -p ~/.poshthemes
  # cp -R ./themes/* ~/.poshthemes
  cp -R ./themes/starship.toml ~/.config/starship.toml
  cp -R ./themes/warp.yml ~/.warp/themes/catppuccin_frappe.yml
  echo "👉 copy theme done"
}

function copy_yabai() {
  mkdir -p ~/.config/yabai
  mkdir -p ~/.config/skhd

  cp -R ./tiling/skhdrc ~/.config/skhd/
  cp -R ./tiling/yabairc ~/.config/yabai/

  skhd --restart-service
  yabai --restart-service
  # mkdir -p ~/.config/aerospace
  # cp ./tiling/aerospace.toml ~/.config/aerospace/aerospace.toml
  # aerospace enable on
  # aerospace reload-config
  echo "👉 copy tiling manager workspace done"
}

function copy_lazyvim() {
  rm -rf ~/.config/nvim
  cp -r ./lazyVim ~/.config/nvim
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
  "zsh")
    copy_zsh
    ;;
  "ghostty")
    copy_ghostty
    ;;
  "kitty")
    copy_kitty
    ;;
  "themes")
    copy_theme
    ;;
  "vim")
    copy_lazyvim
    ;;
  "tiling")
    copy_yabai
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
