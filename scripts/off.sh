#!/bin/bash

echo "running shutdown script..."

fmtdate="$(date +%m/%d)"
message="[${fmtdate}]"

cd ~/learn
	git add -A
	git status
	~/.dotfiles/scripts/./commit.sh || echo "learn failed :("
sleep 2

read -p "do you want to sc?    " reply
if [[ $reply == "y" ]]; then
	echo 'y' | sudo pacman -Sc
	echo 'y' | yay -Sc
fi

cd ~/.dotfiles
	echo "pacman: " >| ~/.dotfiles/packages.txt
	pacman -Qe >> ~/.dotfiles/packages.txt
	echo -e "\nnpm: " >> ~/.dotfiles/packages.txt
	npm list -g --depth=0 >> ~/.dotfiles/packages.txt
	echo -e "\npip: " >> ~/.dotfiles/packages.txt
	echo "package lists updated"
	pip list --not-required >> ~/.dotfiles/packages.txt
	git add -A
	git status
	~/.dotfiles/scripts/./commit.sh || echo "dotfiles failed :("
sleep 2

sync

echo '5' & sleep 1
echo '4' & sleep 1
echo '3' & sleep 1
echo '2' & sleep 1
echo '1' & sleep 1

shutdown now
