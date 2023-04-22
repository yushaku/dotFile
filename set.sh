#! /bin/bash
if [[ -z "$1" ]]; then
	echo "please pick one of those option:"
	echo "zsh | tmux | theme | lazyVim | all"
	exit 0
fi

function copy_zsh() {
	rm -rf ~/.config/zsh
	cp -R ./shell/config ~/.config/zsh
	cp ./shell/zshrc ~/.zshrc
	echo "👉 copy zsh done"
}

function copy_theme() {
	rm -rf ~/.poshthemes
	mkdir ~/.poshthemes
	cp -R ./shell/themes/takuya.omp.json ~/.poshthemes
	cp -R ./shell/themes/yushaku.omp.json ~/.poshthemes
	echo "👉 copy theme done"
}

function copy_lazyvim() {
	rm -rf ~/.config/nvim
	cp -rR ./lazyVim ~/.config/nvim
	echo "👉 copy lazyVim done"
}

function copy_tmux() {
	cp -R ./tmux ~/.config/
	echo "👉 copy file to .tmux.conf done"
}

if [ "$1" == "tmux" ]; then
	copy_tmux

elif [ "$1" == "shell" ]; then
	copy_zsh

elif [ "$1" == "theme" ]; then
	copy_theme

elif [ "$1" == "lazyVim" ]; then
	copy_lazyvim

elif
	[ "$1" == "all" ]
then
	copy_zsh
	copy_theme
	copy_tmux
	copy_lazyvim

	echo "⭐ set all config to system successfully"

else
	echo "do not know that option"
	echo "please pick one of those option:"
	echo "zsh | tmux | theme | lazyVim | all"
fi
