#!/bin/bash

install_tools() {
	apps=("tmux" "exa" "bat", "fd-find", "ripgrep", "xclip")
	for app in "${apps[@]}"; do
		if ! command -v $app &>/dev/null; then
			sudo apt install -y "$app"
			echo "installed $app sucessfully"
		fi
	done
}

install_ohmypost() {
	if ! command -v oh-my-posh &>/dev/null; then
		sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
		sudo chmod +x /usr/local/bin/oh-my-posh
		echo "✅ installed oh-my-posh. theme for your terminal"
	fi
}

install_js() {
	apps=("npm" "node", "yarn" "pnpm")

	for app in "${apps[@]}"; do
		echo $app
		if ! command -v $app &>/dev/null; then
			if [ $app == "yarn" ]; then
				npm install -g yarn
			elif [ $app == "pnpm" ]; then
				npm install -g pnpm
			else
				sudo apt install -y "$app"
				echo "Installed $app successfully"
			fi
		fi
	done
}

install_nvm() {
	if ! command -v nvm &>/dev/null; then
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
		source ~/.nvm/nvm.sh
		command -v nvm
	fi

}

install_docker() {
	if ! command -v docker &>/dev/null; then
		sudo apt install -y docker docker-compose docker-doc docker-registry docker.io
		# add user to docker group
		sudo usermod -aG docker $USER
		docker version
	fi
}

install_fzf() {
	if ! command -v fzf &>/dev/null; then
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		~/.fzf/install
	fi
}

install_nvim() {
	if ! command -v nvim &>/dev/null; then
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		chmod u+x nvim.appimage
		./nvim.appimage

		if [! $? -eq 0]; then
			./nvim.appimage --appimage-extract
			./squashfs-root/AppRun --version

			# Optional: exposing nvim globally.
			sudo mv squashfs-root /
			sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
			nvim
		fi

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

if [[ $1 == "zsh" ]]; then
	install_zsh
	install_ohmypost

	echo "zsh are installed 💠"
elif [[ $1 == "tools" ]]; then
	install_tools
	install_fzf
	install_nvim

	echo "tools and plugin are installed 💠"
elif [[ $1 == "js" ]]; then
	install_js
	install_nvm

	echo "coding env are installed 💠"
elif [[ $1 == "docker" ]]; then
	install_docker
	echo "docker and docker compose are installed 💠"
fi
