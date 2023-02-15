#!/bin/bash
#
set -eux

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
