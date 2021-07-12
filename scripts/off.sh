#!/bin/bash

echo "running shutdown script..."

fmtdate="$(date +%m/%d)"
message="[${fmtdate}]"

read -p "do you want to sc?    " reply
if [[ $reply == "y" ]]; then
	echo 'y' | sudo pacman -Sc
	echo 'y' | yay -Sc
fi

read -p "do you want to update packages?     " reply
if [[ $reply == "y" ]]; then
	sudo pacman -Syu
	yay
fi

# read -p "do you want to update pip?     " reply
# if [[ $reply == "y" ]]; then
# 	# pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
# 	for i in $(pip list -o | awk 'NR > 2 {print $1}')
# 		do pip install -U $i
# 	done
# fi

read -p "do you want to update npm?     " reply
if [[ $reply == "y" ]]; then
	sudo npm update -g
fi

cd ~/.dotfiles
	pacman -Qqen > ~/.dotfiles/packages/arch-pkglist.txt
	pacman -Qqem > ~/.dotfiles/packages/aur-pkglist.txt	
	npm list -g --depth=0 > ~/.dotfiles/packages/npm-pkglist.txt
	pip freeze > ~/.dotfiles/packages/pip-pkglist.txt

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
