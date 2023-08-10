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

function myip() {
	echo "Your ip is:"
	curl ipinfo.io/ip
}

function port-kill() {
	ports=$(sudo lsof -t -i:"$1")

	if [[ $(echo "$ports" | wc -l) -gt 0 ]]; then
		echo -n "remove process:\n '$ports' \n"
		sudo kill -9 $(sudo lsof -t -i:"$1")
	else
		echo "no port $1 is running!!!"
	fi
}

function port-list() {
	sudo netstat -tulpn | grep LISTEN "$@"
}

function ip-addr() {
	ip addr | grep noprefixroute | grep -v inet6
}

function pick-aliases() {
	local selected_alias
	selected_alias=$(alias | fzf --height=40% --prompt="Alias> " | cut -d "=" -f 1)
	if [[ -n "$selected_alias" ]]; then
		BUFFER="$selected_alias"
		zle reset-prompt
	fi
}

zle -N pick-aliases
bindkey '^A' pick-aliases
