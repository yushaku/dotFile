#! /bin/bash

if [ $1 == "tmux" ]; then
  cp tmux/tmux.conf ~/.tmux.conf
  echo "copy file .tmux.conf done"

elif [ $1 == "zsh" ]; then
  cp zsh/zshrc ~/.zshrc
  echo "copy file .zshrc done"

elif [ $1 == "nvim" ]; then
  rm -rf ~/.config/nvim/lua
  cp nvim/init.lua ~/.config/nvim/init.lua
  cp -R ./nvim/lua ~/.config/nvim/lua
  echo "copy folder nvim done"

elif [ $1 == "all" ]; then
  cp tmux/tmux.conf ~/.tmux.conf
  cp zsh/zshrc ~/.zshrc
  cp nvim/init.lua ~/.config/nvim/init.lua
  cp -R ./nvim/lua ~/.config/nvim

  echo "copy folder nvim done"
fi
