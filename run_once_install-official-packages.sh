#!/bin/bash

set -eux

packages=(
	bat
	deno
	docker
	dust
	exa
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
	starship
	tmux
	unzip
	zip
)

for package in ${packages[@]}; do
	sudo apt install -y $package
done
