#! /bin/bash

if [ $1 == "tmux" ]
  then
    cp tmux/tmux.conf ~/.tmux.conf
    echo "copy file .tmux.conf done"

elif [ $1 == "zsh" ]
  then
    cp zsh/zshrc ~/.zshrc
    echo "copy file .zshrc done"

elif [ $1 == "nvim" ]
  then
    cp nvim/init.vim ~/.config/nvim/init.vim
    cp -R ./nvim/vim-plug ~/.config/nvim
    echo "copy folder nvim done"

elif [ $1 == "all" ]
  then
    cp tmux/tmux.conf ~/.tmux.conf
    cp zsh/zshrc ~/.zshrc
    cp nvim/init.vim ~/.config/nvim/init.vim
    cp -R ./nvim/vim-plug ~/.config/nvim

    echo "copy folder nvim done"
fi
