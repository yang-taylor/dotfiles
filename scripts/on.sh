#!/bin/bash

sudo pacman -Syu
yay -Syu

npm update -g

cd ~/learn
	git pull && echo "learn updated"
	git push

cd ~/.dotfiles
	git pull && echo "dotfiles updated"
	git push
