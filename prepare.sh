#!/bin/bash

install_grep() {
	if ! command -v rg &>/dev/null; then
		echo "ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern:"
		read -rp "do you wanna install ripgrep: y(yes) or n(no)" option
		if [[ $option == "y" ]]; then
			sudo apt install ripgrep
			exit
		fi
	fi
}

install_tmux() {
	if ! command -v tmux &>/dev/null; then
		echo "Tmux is a terminal multiplexer an alternative to GNU Screen. You can start a Tmux session and then open multiple windows inside that session"
		read -rp "do you wanna install tmux: y(yes) or n(no)" option
		if [[ $option == "y" ]]; then
			sudo apt install tmux
			exit
		fi
	fi
}

install_exa() {
	if ! command -v exa &>/dev/null; then
		echo "exa is a modern replacement for the venerable file-listing command-line program"
		read -rp "do you wanna install exa: y(yes) or n(no)" option
		if [[ $option == "y" ]]; then
			sudo apt install exa
			exit
		fi
	fi
}

install_batcat() {
	if ! command -v batcat &>/dev/null; then
		echo "supports syntax highlighting for a large number of programming and markup languages"
		read -rp "do you wanna install batcat: y(yes) or n(no)" option
		if [[ $option == "y" ]]; then
			sudo apt install batcat
			exit
		fi
	fi
}

install_fdfind() {
	if ! command -v fd &>/dev/null; then
		echo "fd is a program to find entries in your filesystem. It is a simple, fast and user-friendly alternative to find"
		read -rp "do you wanna install fd-find: y(yes) or n(no)" option
		if [[ $option == "y" ]]; then
			sudo apt install fd-find
			exit
		fi
	fi
}

echo "there are some plug in so good to use in your terminal"

install_exa
install_tmux
install_batcat
install_fdfind
install_grep
