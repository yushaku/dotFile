function myip() {
  echo "Your ip is:"
  curl ipinfo.io/ip
}

function killport() {
  ports=$(sudo lsof -t -i:$1)

  if [[ $(echo $ports | wc -l) > 0 ]]; then
    echo -n "remove process:\n $ports \n"
    sudo kill -9 $(sudo lsof -t -i:$1)
  else
    echo "no port $1 is running!!!"
  fi
}

function ide (){
  tmux split-window -v -p  30
  tmux split-window -h
  tmux select-pane -t 1
}

function open-port() {
  sudo netstat -tulpn | grep LISTEN $@
}

function ip-addr() {
  ip addr | grep noprefixroute | grep -v inet6
}
