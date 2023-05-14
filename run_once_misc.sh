#!/bin/bash
#
set -eux

# timezone
sudo timedatectl set-timezone Asia/Tokyo

# npm update
sudo npm install -g n
sudo n latest

# trash-cli
sudo mkdir --parent /.Trash
sudo chmod a+rw /.Trash
sudo chmod +t /.Trash

# npm without sudo
npm
sudo chown -R $(whoami) ~/.npm

# default shell to fish
sudo chsh -s /usr/bin/fish
