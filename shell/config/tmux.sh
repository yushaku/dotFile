if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
	bash $HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh
fi

##>> tmux shotcut --------------------
function t() {
	if [[ -z $1 ]]; then
		TERM=screen-256color-bce tmux
	else
		TERM=screen-256color-bce tmux new-session -A -s "$1"
	fi
}
alias tls="tmux ls"
alias ta="tmux attach -t"
alias tad='tmux attach -d -t'
alias tksv="tmux kill-server"
alias trm="tmux kill-session -t"
alias ts-on="tmux set-option status on"
alias ts-off="tmux set-option status off"
