#!/bin/bash

sudo pacman -Syu
yay

cd ~/learn
	git pull && echo "learn updated"
	git push

cd ~/.dotfiles
	git pull && echo "dotfiles updated"
	git push
