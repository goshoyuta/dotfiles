#!/bin/bash

set -eux

snap_packages=(
	deno
	docker
	dust
	jq
	lazygit
)

apt_packages=(
	bat
	find-fd
	fish
	fuse # for neovim
	fzf
	github-cli
	golang-go
	neovim
	nodejs
	npm
	ntp
	openssh
	python
	python3-pip
	ripgrep
	rust
	tmux
	unzip
	zip
)

python_packages=(
	bs4
	html5lib
	lxml
	openpyxl
	playwright
	python-shukujitsu
	selenium
	tabula-py
	tenacity
	trash-cli
	urlwatch
	webdriver-manager
	xlsx2csv
)

for snap_package in ${snap_packages[@]}; do
	sudo snap install $package
done

for apt_package in ${apt_packages[@]}; do
	sudo apt install -y $package
done

for python_package in ${python_packages[@]}; do
	pip3 install $python_package
done

# neovim (apt is too old)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
sudo ./nvim.appimage /usr/bin/nvim

# ghq
go install github.com/x-motemen/ghq@latest

# gh
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
