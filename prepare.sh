#!/bin/bash

install_grep() {
	if ! command -v rg &>/dev/null; then
		echo "ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern:"
		sudo apt install ripgrep -y
	fi
}

install_tmux() {
	if ! command -v tmux &>/dev/null; then
		echo "Tmux is a terminal multiplexer an alternative to GNU Screen. You can start a Tmux session and then open multiple windows inside that session"
		sudo apt install tmux -y
	fi
}

install_exa() {
	if ! command -v exa &>/dev/null; then
		echo "exa is a modern replacement for the venerable file-listing command-line program"
		sudo apt install exa -y
	fi
}

install_batcat() {
	if ! command -v batcat &>/dev/null; then
		echo "supports syntax highlighting for a large number of programming and markup languages"
		sudo apt install batcat -y
	fi
}

install_fdfind() {
	if ! command -v fdfind &>/dev/null; then
		echo "✅ fd is a program to find entries in your filesystem. installed fdfine"
		sudo apt install fd-find -y
	fi
}

install_ohmypost() {
	if ! command -v oh-my-posh &>/dev/null; then
		echo "✅ installed oh-my-posh. theme for your terminal"
		sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
		sudo chmod +x /usr/local/bin/oh-my-posh
	fi
}

install_fzf() {
	if ! command -v fzf &>/dev/null; then
		echo "✅ installed fzf"
		sudo apt install fzf -y
	fi
}

install_zsh() {
	if ! command -v zsh &>/dev/null; then
		echo "✅ installed zsh"
		sudo apt-get install zsh -y

		echo "✅ installed oh my zsh"
		sudo curl -L http://install.ohmyz.sh | sh
		chsh -s "$(which zsh)"
	fi
}

echo "tools and plugin are installed 💠"

if [[ $1 == "zsh" ]]; then
	install_zsh
	install_ohmypost
elif [[ $1 == "tools" ]]; then
	install_exa
	install_tmux
	install_batcat
	install_fdfind
	install_grep
	install_fzf
fi
