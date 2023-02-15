#!/bin/bash
#
set -eux

# npm update
sudo npm install -g n
sudo n latest

# in fish shell
fish -c 'fisher install jethrokuan/z'
fish -c 'fisher install patrickf1/fzf.fish'

# trash-cli
sudo mkdir --parent /.Trash
sudo chmod a+rw /.Trash
sudo chmod +t /.Trash

# npm without sudo
npm
sudo chown -R $(whoami) ~/.npm

# change default shell
chsh -s $(which fish)

# pacman.conf
sudo reflector --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo systemctl enable reflector.service
sudo systemctl enable paccache.timer
