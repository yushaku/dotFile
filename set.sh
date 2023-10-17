#! /bin/bash
if [[ -z "$1" ]]; then
	echo "please pick one of those option:"
	echo "zsh | tmux | themes | lazyVim | all"
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
	cp -R ./themes/takuya.omp.json ~/.poshthemes
	cp -R ./themes/yushaku.omp.json ~/.poshthemes
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

for arg in "$@"; do
	echo "Argument: $arg"
	if [ "$arg" == "tmux" ]; then
		copy_tmux

	elif [ "$arg" == "shell" ]; then
		copy_zsh

	elif [ "$arg" == "themes" ]; then
		copy_theme

	elif [ "$arg" == "lazyVim" ]; then
		copy_lazyvim

	# elif [ "$arg" == "all" ]; then
	# 	copy_zsh
	# 	copy_theme
	# 	copy_tmux
	# 	copy_lazyvim
	# 	echo "⭐ set all config to system successfully"

	else
		echo "do not know that option"
		echo "please pick one of those option:"
		echo "zsh | tmux | themes | lazyVim | all"
	fi
done
