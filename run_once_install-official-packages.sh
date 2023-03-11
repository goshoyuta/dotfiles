#!/bin/bash
#
set -eux

packages=( \
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
  pacman-contrib \
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

for package in ${packages[@]}; do
  sudo pacman -S --needed --noconfirm $package
done
