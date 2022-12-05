#! /bin/bash

cp ~/.tmux.conf ./tmux/tmux.conf
cp ~/.zshrc ./zsh/zshrc
cp ~/.config/nvim/init.vim ./nvim/init.vim
cp -R ~/.config/nvim/vim-plug ./nvim

echo "get all new file config success"
