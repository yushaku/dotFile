#! /bin/bash
if [[ -z "$1" ]]; then
  echo "please pick one of those option:"
  echo "zsh | tmux | theme | nvim | all"
  exit 0 
fi

function copy_zsh() {
  rm -rf ~/.zsh
  cp ./shell/zshrc ~/.zshrc
  cp -R ./shell/config ~/.zsh
  echo "👉 copy zsh done"
}

function copy_theme() {
  if [ ! -d ~/.poshthemes/ ]; then
    echo 'create new folder .poshthemes'
    mkdir -p ~/.poshthemes/
  fi
  cp ./shell/yushaku.omp.json ~/.poshthemes/yushaku.omp.json
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

function copy_tmux() {
  cp -R ./tmux ~/.config/
  echo "👉 copy file to .tmux.conf done"
}

if [ "$1" == "tmux" ]; then
  copy_tmux

elif [ "$1" == "zsh" ]; then
  copy_zsh

elif [ "$1" == "theme" ]; then
  copy_theme
elif [ "$1" == "nvim" ]; then
  copy_nvim
elif [ "$1" == "nvim-plugs" ]; then
  rm -rf ~/.config/nvim/plugin/packer_compiled.lua
  cp -R ./nvim/plugin/packer_compiled.lua ~/.config/nvim/plugin/packer_compiled.lua
elif

  [ "$1" == "all" ]
then
  copy_zsh
  copy_nvim
  copy_theme
  copy_tmux

  echo "⭐ set all config to system successfully"

else
  echo "do not know that option"
  echo "please pick one of those option:"
  echo "zsh | tmux | theme | nvim | all"
fi
