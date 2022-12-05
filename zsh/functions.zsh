if [ -f .nvmrc ]; then
  nvm use
fi

function myip() {
  echo "Your ip is:"
  curl ipinfo.io/ip
}
