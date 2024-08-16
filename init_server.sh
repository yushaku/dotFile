#!/bin/bash

# Function to install a package if it's not already installed
install_app() {
  if ! command -v "$1" &>/dev/null; then
    echo "Installing $2..."
    eval "$3"
    echo "✅ Installed $2"
  else
    echo "✅ $2 is already installed"
  fi
}

# Update the package list
sudo apt update

# Install Git
install_app git "Git" "sudo apt install -y git"

# Install Redis
install_app redis-server "Redis" "sudo apt install -y redis-server"

# Install PostgreSQL
install_app psql "PostgreSQL" "sudo apt install -y postgresql postgresql-contrib"

# Install nvm (Node Version Manager)
install_app nvm "nvm" "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && source ~/.bashrc"

# Install Node.js using nvm
if ! command -v node &>/dev/null; then
  echo "Installing Node.js..."
  nvm install --lts
  nvm use --lts
  echo "✅ Installed Node.js"
else
  echo "✅ Node.js is already installed"
fi

# Install pnpm
install_app pnpm "pnpm" "npm install -g pnpm"

# Install Yarn
install_app yarn "Yarn" "npm install -g yarn"

# Install NGINX
install_app nginx "NGINX" "sudo apt install -y nginx && sudo systemctl enable nginx && sudo systemctl start nginx"

echo "🎉 All essential applications have been installed!"
