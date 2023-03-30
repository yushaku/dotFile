function myip() {
  echo "Your ip is:"
  curl ipinfo.io/ip
}

function port-kill() {
  ports=$(sudo lsof -t -i:$1)

  if [[ $(echo $ports | wc -l) > 0 ]]; then
    echo -n "remove process:\n $ports \n"
    sudo kill -9 $(sudo lsof -t -i:$1)
  else
    echo "no port $1 is running!!!"
  fi
}

function ide (){
  if [[ $1 == 3 ]]; then
    tmux split-window -v -p  30
    tmux split-window -h
    tmux select-pane -t 1
  elif [[ $1 == 2 ]]; then
    tmux split-window -v -p 30
    tmux select-pane -t 1
  else
    tmux split-window -h -p 30
    tmux select-pane -t 1
  fi
}

function port-list() {
  sudo netstat -tulpn | grep LISTEN $@
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

