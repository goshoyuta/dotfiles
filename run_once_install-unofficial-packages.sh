#!/bin/bash
#
set -eux

go install github.com/x-motemen/ghq@latest

aur_pkgs=(
	act
	nkf
	rar
)

for aur_pkg in ${aur_pkgs[@]}; do
	yay -S --needed --noconfirm $aur_pkg
done
