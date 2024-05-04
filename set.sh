#! /bin/bash
if [[ -z "$1" ]]; then
	echo "please pick one of those option:"
	echo "shell | tmux | themes | lazyVim | warp | all"
	exit 0
fi

function copy_zsh() {
	rm -rf ~/.config/zsh
	cp -R ./shell/config ~/.config/zsh
	cp ./shell/zshrc ~/.zshrc
	echo "👉 copy zsh done"
}

function copy_theme() {
	mkdir -p ~/.poshthemes
	cp -R ./themes/* ~/.poshthemes
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

function isCopyAll() {
	local arguments=$@
	[[ "$arguments" =~ "all" ]]
}

for arg in "$@"; do
	if isCopyAll "$@"; then
		echo "⭐ set all config to system successfully"
		copy_zsh
		copy_theme
		copy_tmux
		copy_lazyvim
		copy_warp
		exit 1
	fi

	echo "Argument: $arg"
	if [ "$arg" == "tmux" ]; then
		copy_tmux

	elif [ "$arg" == "shell" ]; then
		copy_zsh

	elif [ "$arg" == "themes" ]; then
		copy_theme

	elif [ "$arg" == "lazyVim" ]; then
		copy_lazyvim

	elif [ "$arg" == "warp" ]; then
		copy_warp

	elif [ "$arg" == "warp_theme" ]; then
		copy_warp_theme

	else
		echo "do not know that option"
		echo "please pick one of those option:"
		echo "shell | tmux | themes | lazyVim | warp | all"
	fi
done
