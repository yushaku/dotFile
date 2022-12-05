#! /bin/bash

function copy_zsh() {
  if [ ! -d ~/.zsh ]; then
    echo 'create new folder .zsh'
    mkdir -p ~/.zsh
  fi

  cp zsh/zshrc ~/.zshrc
  cp zsh/aliases.zsh ~/.zsh/aliases.zsh
  cp zsh/theme.zsh ~/.zsh/theme.zsh
  cp zsh/functions.zsh ~/.zsh/functions.zsh
  cp zsh/fzf.zsh ~/.zsh/fzf.zsh
  echo "👉 copy zsh done"
}

function copy_theme() {
  if [ ! -d ~/.poshthemes/ ]; then
    echo 'create new folder .poshthemes'
    mkdir -p ~/.poshthemes/
  fi
  cp zsh/yushaku.omp.json ~/.poshthemes/yushaku.omp.json
  echo "👉 copy theme done"
}

function copy_nvim() {
  if [ ! -d ~/.config/nvim ]; then
    echo 'create new folder nvim'
    mkdir -p ~/.config/nvim/
  fi

  rm -rf ~/.config/nvim/lua
  cp nvim/init.lua ~/.config/nvim/init.lua
  cp -R ./nvim/lua ~/.config/nvim/lua
  echo "👉 copy nvim done"
}

if [ $1 == "tmux" ]; then
  cp tmux/tmux.conf ~/.tmux.conf
  echo "👉 copy file to .tmux.conf done"

elif [ $1 == "zsh" ]; then
  copy_zsh

elif [ $1 == "theme" ]; then
  copy_theme
elif [ $1 == "nvim" ]; then
  copy_nvim
elif

  [ $1 == "all" ]
then
  copy_zsh
  copy_nvim
  copy_theme
  cp tmux/tmux.conf ~/.tmux.conf

  echo "⭐ set all config to system successfully"

else
  echo "do not know that option"
  echo "please pick one of those option:"
  echo "zsh | tmux | theme | nvim | all"
fi
