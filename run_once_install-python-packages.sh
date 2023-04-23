#!/bin/bash
#
set -eux

packages=(
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

for package in ${packages[@]}; do
	pip install $package
done
