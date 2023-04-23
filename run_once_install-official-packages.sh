#!/bin/bash

set -eux

packages=(
	bat
	docker
	dust
	fd
	fzf
	github-cli
	golang-go
	jq
	lazygit
	neovim
	nodejs
	npm
	ntp
	openssh
	python
	python-pip
	ripgrep
	rust
	tmux
	unzip
	zip
)

for package in ${packages[@]}; do
	sudo apt install -y $package
done
