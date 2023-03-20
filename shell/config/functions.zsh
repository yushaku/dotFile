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

function dev () {
  if [[ -z $1 ]]; then
    echo "Please enter your project name"
    return 
  fi

  if [[ -z $2 ]]; then
    editer=nvim
  elif [[ $2 == "-v" ]]; then
    editer="nvim"
  elif [[ $2 == "-c" ]]; then
     editer="code" 
  fi

  z $1
  if [[ $! == 0 ]]; then
    $editer .
  fi
 }

function open-port() {
  sudo netstat -tulpn | grep LISTEN $@
}

function ip-addr() {
  ip addr | grep noprefixroute | grep -v inet6
}
