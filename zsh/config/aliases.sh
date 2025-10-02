##>> File system tree ------------------
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'

##>> replate old command of linux ----------
alias e="exit"
alias cl="clear"
alias vi="nvim"
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/lua/config/lazy.lua"
alias dnsconfig="nvim /etc/resolv.conf"
alias ll="eza -lha --time-style=long-iso --icons --no-time --no-user --colour-scale --group-directories-first"
function lk() {
  eza --tree --long --header -n --no-time --no-user --no-filesize --icons -s="name" -I='node_modules|dist|deploy' -L "${1:-2}"
}
alias ss="source ~/.zshrc"

# # Fix Alt+Left/Right arrow keys for word navigation
bindkey "^[[1;3D" backward-word # Alt+Left
bindkey "^[[1;3C" forward-word  # Alt+Right

##>> docker && docker compose --------------------
alias d="docker"
alias dco="docker-compose"
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

function _package_manager() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f bun.lock ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npq-hero "$@"
  elif [[ -f Cargo.toml ]]; then
    command cargo "$@"
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
