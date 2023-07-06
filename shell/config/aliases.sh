##>> shot-cut open config file -------------------------
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias viconfig="cd ~/.config/nvim && nvim ~/.config/nvim/init.lua"
alias dotfile="z dotfile && nvim set.sh"

##>> File system tree ------------------
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'

##>> replate old command of linux ----------
alias e="exit"
alias cl="clear"
alias vi="nvim"
alias cat="batcat"
alias b-theme="batcat --list-themes | fzf --preview='batcat --theme={} --color=always ~/.zshrc'"
alias fd="fdfind"
alias ll="exa -lha --time-style=long-iso --icons --colour-scale --group-directories-first"
function lk() {
	exa --tree --long --header -n --no-time --no-user --no-filesize --icons -s="name" -I='node_modules|dist|deploy' -L "${1:-2}"
}
alias ss="source ~/.zshrc"

##>> apt manager --------------
alias sid="sudo dpkg -i"
alias si="sudo apt install -y"
alias srm="sudo apt remove -y"
alias scl="sudo apt autoremove -y && sudo apt clean -y"
alias supdate="sudo apt update -y && sudo apt upgrade -y"

##>> npm && yarn -------------------
alias n="npm"
alias nrm="npm remove"
alias na="npm install"
alias nad="npm install -d"
alias nb="npm build"

alias y="yarn"
alias yrm="yarn remove"
alias ya="yarn add"
alias yad="yarn add -D"
alias yb="yarn build"

##>> pnpm start --------------------------
alias p="pnpm"
alias pi="pnpm install"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias prm="pnpm remove"
alias pb="pnpm build"

export PNPM_HOME="/home/yushaku/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

##>> 1.1.1.1 cloudflare --------------------
alias wcc="warp-cli connect"
alias wcd="warp-cli disconnect"
alias wci="sudo systemctl start warp-svc.service"

##>> Connect wifi  -------------------------

##>> shot-cut create projects ----------------------
alias next="yarn create next-app"

##>> docker && docker compose --------------------
alias d="docker"
alias dco="docker-compose"
alias dcou="docker-compose up"
alias dcod="docker-compose down"
alias dps="docker ps"
alias dim="docker images"
alias dcn="docker container ls"
alias drmia="docker image prune -a"
alias drmi="docker image prune"
function d-exec() {
	docker exec -it "$1" bash
}

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

##>> system shotcut turn off
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

##>> convert video to mp4
video2mp4() {
	ffmpeg -y -i "${1}" -vf "fps=${2:-12},pad=ceil(iw/2)*2:ceil(ih/2)*2" "${1}.mp4"
}
alias jpg='jpegoptim --strip-all'
alias png='optipng'
