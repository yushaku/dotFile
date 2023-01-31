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
alias j="z"
alias cl="clear"
alias vi="nvim"
alias cat="batcat"
alias fd="fdfind"
alias ll="exa -lh --time-style=long-iso --icons --colour-scale --group-directories-first"
function lk () {
  if [[ -z $1 ]]; then
    num=2 
  else
    num=$1 
  fi
  exa --tree --long --header -n --no-time --icons -s="name" -I='node_modules|dist|deploy' -L $num
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
alias wifion="nmcli nm wifi on"
alias wifioff="nmcli nm wifi off"
alias wifishow="nmcli device wifi list"
alias rescanwifi="nmcli device wifi rescan"
cnwifi() {
  nmcli device wifi connect $1 password $2
}

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
function dex (){
  docker exec -it $1 bash
} 

##>> tmux shotcut --------------------
alias t="TERM=screen-256color-bce tmux"
alias tls="tmux ls"
alias ta="tmux attach -t"
alias tad='tmux attach -d -t'
alias tksv="tmux kill-server"
alias trm="tmux kill-session -t"

##>> system shotcut turn off
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
