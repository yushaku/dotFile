#! /bin/bash

if [ $1 == "tmux" ]; then
  cp tmux/tmux.conf ~/.tmux.conf
  echo "copy file to .tmux.conf done"

elif [ $1 == "zsh" ]; then
  cp zsh/zshrc ~/.zshrc
  echo "copy file to .zshrc done"

elif [ $1 == "theme" ]; then
  cp zsh/yushaku.omp.json ~/.poshthemes/yushaku.omp.json
  echo "theme done"

elif [ $1 == "nvim" ]; then
  rm -rf ~/.config/nvim/lua
  cp nvim/init.lua ~/.config/nvim/init.lua
  cp -R ./nvim/lua ~/.config/nvim/lua
  echo "copy to folder .config/nvim done"

elif [ $1 == "all" ]; then
  cp tmux/tmux.conf ~/.tmux.conf
  cp zsh/zshrc ~/.zshrc
  cp nvim/init.lua ~/.config/nvim/init.lua
  cp -R ./nvim/lua ~/.config/nvim

  echo "set all config to system successfully"

else
  echo "do not know that option"
  echo "please pick one of those option:"
  echo "zsh | tmux | theme | nvim | all"
fi
