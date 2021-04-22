alias ls='exa --color=auto -alF'
alias list='\ls --color=auto'
alias tree='exa --tree'
alias add='git add -A && git status'
alias df='df -h /dev/sda2'
alias ping='ping -c 1'
alias off='~/.dotfiles/scripts/./off.sh'
alias on='~/.dotfiles/scripts/./on.sh'
alias texmk='~/.dotfiles/scripts/./texmk.sh'
alias create='~/.dotfiles/scripts/./create.sh'
alias commit='~/.dotfiles/scripts/./commit.sh'
alias pacman='sudo pacman'
alias npm='sudo npm'
alias sqlite='sqlite3'
alias fonts='fc-list'
alias sql='sudo -iu postgres'
alias :q='cd ..'
alias :x='cd ..'

dl-music() {
	youtube-dl -x --audio-format mp3 "$1"
}

tldr() {
	curl cheat.sh/$1
}

search() {
	pacman -Ss $1
	yay -Ss $1
}

systemctl-begin() {
	systemctl enable $1 && systemctl start $1
}

git-clean-history() {
	git checkout --orphan newBranch
	git add -A
	git commit -m "$(date): clean"
	git branch -D main
	git branch -m main
	echo 'remember: "git push -f origin main" and "git gc --aggressive --prune=all"'
}
