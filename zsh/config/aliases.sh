##>> File system tree ------------------
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'

##>> replate old command of linux ----------
alias e="exit"
alias cl="clear"
alias vi="nvim"
alias b-theme="batcat --list-themes | fzf --preview='batcat --theme={} --color=always ~/.zshrc'"
alias zshconfig="nvim ~/.zshrc"
alias viconfig="nvim ~/.config/nvim/lua/config/lazy.lua"
alias dnsconfig="nvim /etc/resolv.conf"
alias ll="exa -lha --time-style=long-iso --icons --no-time --no-user --colour-scale --group-directories-first"
function lk() {
  exa --tree --long --header -n --no-time --no-user --no-filesize --icons -s="name" -I='node_modules|dist|deploy' -L "${1:-2}"
}
alias ss="source ~/.zshrc"

##>> apt manager --------------
alias sid="sudo dpkg -i"
alias srmd="sudo dpkg --remove"
alias si="sudo apt install -y"
alias srm="sudo apt remove -y"
alias scl="sudo apt autoremove -y && sudo apt clean -y"
alias supdate="sudo apt update -y && sudo apt upgrade -y"

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

function json-to-ts() {
  local output="${2:-/tmp/output_quicktype.ts}"
  local tmp="/tmp/short.ts"
  quicktype --just-types --prefer-types --prefer-unions -o "$tmp" "$1"
  cat "$tmp" >>"$output"
  rm "$tmp"
  batcat "$output"
}

alias jtt='json-to-ts'

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

function _package_manager() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command pnpm "$@"
  fi
}

alias p='_package_manager'
alias pi='_package_manager install'
alias pa='_package_manager add'
alias pad='_package_manager add -D'
alias prm='_package_manager remove'
alias pb='_package_manager build'

vo() {
  if openvpn3 session-stats --config unich-sonlv &>/dev/null; then
    echo "VPN is running."
  else
    echo "Starting VPN ... "
    openvpn3 session-start -c unich-sonlv
  fi
}

vc() {
  echo "Stopping VPN ... "
  openvpn3 session-manage -c unich-sonlv --disconnect
}
