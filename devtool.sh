install_git() {
	if ! command -v git &>/dev/null; then
		echo "Git is not installed on this system."
		while true; do
			read -rp "Do you want to install it? (y/n): " option
			case $option in
			[Yy]*)
				sudo apt install git
				break
				;;
			[Nn]*)
				echo "Git installation aborted."
				return
				;;
			*)
				echo "Invalid option. Please enter 'y' or 'n'."
				;;
			esac
		done
	else
		echo "Git is already installed on this system."
	fi
}

echo "💻💻💻 install must have stuff:"
install_git
