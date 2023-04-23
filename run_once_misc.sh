#!/bin/bash
#
set -eux

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
