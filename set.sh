#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -z "$1" ]]; then
  OPTIONS=("zsh" "tmux" "themes" "vim" "ghostty" "kitty" "warp" "warp_theme" "tiling" "all")

  SELECTION=$(printf "%s\n" "${OPTIONS[@]}" | fzf --multi --prompt="Select options: ")
else
  SELECTION=$1
fi

if [[ -z "$SELECTION" ]]; then
  echo "No option selected. Please pick one of the following:"
  echo "${OPTIONS[*]}"
  exit 0
fi

# Replace destination with a symlink to source (absolute paths).
link_path() {
  local src="$1"
  local dest="$2"

  if [[ ! -e "$src" ]]; then
    echo "❌ Source not found: $src"
    return 1
  fi

  src="$(cd "$(dirname "$src")" && pwd)/$(basename "$src")"
  mkdir -p "$(dirname "$dest")"

  if [[ -e "$dest" || -L "$dest" ]]; then
    rm -rf "$dest"
  fi

  ln -sfn "$src" "$dest"
  echo "🔗 $dest -> $src"
}

function link_zsh() {
  link_path "$DOTFILES_DIR/zsh/config" "$HOME/.config/zsh"
  link_path "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
  echo "👉 link zsh done"
}

function link_kitty() {
  link_path "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
  echo "👉 link kitty done"
}

function link_ghostty() {
  link_path "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
  echo "👉 link ghostty done"
}

function link_theme() {
  link_path "$DOTFILES_DIR/themes/starship.toml" "$HOME/.config/starship.toml"
  mkdir -p "$HOME/.warp/themes"
  link_path "$DOTFILES_DIR/themes/warp.yml" "$HOME/.warp/themes/catppuccin_frappe.yml"
  echo "👉 link theme done"
}

function link_yabai() {
  mkdir -p "$HOME/.config/yabai"
  mkdir -p "$HOME/.config/skhd"

  link_path "$DOTFILES_DIR/tiling/skhdrc" "$HOME/.config/skhd/skhdrc"
  link_path "$DOTFILES_DIR/tiling/yabairc" "$HOME/.config/yabai/yabairc"

  skhd --restart-service
  yabai --restart-service
  echo "👉 link tiling manager workspace done"
}

function link_lazyvim() {
  link_path "$DOTFILES_DIR/lazyVim" "$HOME/.config/nvim"
  echo "👉 link lazyVim done"
}

function link_tmux() {
  link_path "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"
  echo "👉 link tmux done"
}

function link_warp() {
  link_path "$DOTFILES_DIR/warp" "$HOME/.config/warp-terminal"
  echo "👉 link warp done"
}

function link_warp_theme() {
  WARP_THEMES_DIR="$HOME/.local/share/warp-terminal/themes"
  mkdir -p "$WARP_THEMES_DIR"
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_latte.yml
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_frappe.yml
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_macchiato.yml
  curl --output-dir "$WARP_THEMES_DIR" -LO https://raw.githubusercontent.com/catppuccin/warp/main/dist/catppuccin_mocha.yml
  echo "👉 download warp themes done"
}

if [[ "$SELECTION" == *"all"* ]]; then
  echo "⭐ Linking all configs"
  link_zsh
  link_theme
  link_tmux
  link_lazyvim
  link_ghostty
  link_warp
  link_warp_theme
  exit 0
fi

for option in $SELECTION; do
  case $option in
  "tmux")
    link_tmux
    ;;
  "zsh")
    link_zsh
    ;;
  "ghostty")
    link_ghostty
    ;;
  "kitty")
    link_kitty
    ;;
  "themes")
    link_theme
    ;;
  "vim")
    link_lazyvim
    ;;
  "tiling")
    link_yabai
    ;;
  "warp")
    link_warp
    ;;
  "warp_theme")
    link_warp_theme
    ;;
  *)
    echo "Unknown option: $option"
    ;;
  esac
done
