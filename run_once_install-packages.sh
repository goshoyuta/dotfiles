#!/bin/bash
set -eux

has() {
  type "$1" > /dev/null 2>&1
}

# install packages
linux_pkgs=( \
  alacritty \
  bat \
  curl \
  deno \
  docker \
  dust \
  exa \
  fd \
  fish \
  fisher \
  fzf \
  github-cli \
  jq \
  lazygit \
  mako \
  neovim \
  nodejs \
  npm \
  ntp \
  openssh \
  python \
  python-pip \
  ripgrep \
  rust \
  starship \
  tmux \
  unzip \
  waybar \
  wget \
  wofi \
  zip \
)

for linux_pkg in ${linux_pkgs[@]}; do
  sudo pacman -S --needed --noconfirm $linux_pkg
done

# pip
python_pkgs=( \
  bs4 \
  html5lib \
  lxml \
  openpyxl \
  playwright \
  python-shukujitsu \
  selenium \
  tabula-py \
  tenacity \
  trash-cli \
  urlwatch \
  webdriver-manager \
  xlsx2csv \
)

for python_pkg in ${python_pkgs[@]}; do
  pip install $python_pkg
done

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

# yay
cd ~
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

aur_pkgs=( \
  act \
  ghq \
  google-chrome \
  nkf \
  otf-source-han-code-jp \
  rar \
  spotify-tui \
  xremap-x11-bin \
)

for aur_pkg in ${aur_pkgs[@]}; do
  yay -S --needed --noconfirm $aur_pkg
done

# npm without sudo
npm
sudo chown -R $(whoami) ~/.npm

chsh -s $(which fish)
