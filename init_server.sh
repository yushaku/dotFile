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
install_app fnm "fnm" "curl -fsSL https://fnm.vercel.app/install | bash"

# Install pnpm
install_app pnpm "pnpm" "npm install -g pnpm"

# Install NGINX
install_app nginx "NGINX" "sudo apt install -y nginx && sudo systemctl enable nginx && sudo systemctl start nginx"

echo "🎉 All essential applications have been installed!"
