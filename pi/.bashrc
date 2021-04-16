## cygwin ~/.bashrc

[[ "$-" != *i* ]] && return

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export HOME=/home/pi
export github=git@github.com:tayleyi
export EDITOR=vim

export PS1="\n\[$(tput setaf 5)\]\A \[$(tput setaf 1)\][\u] \n\[$(tput setaf 6)\][\w] \$(tput sgr0)\]\$(parse_git_branch)\n"


shopt -s autocd
set -o noclobber

alias :q='cd ..'
alias ls='ls --color=auto -al'
alias off='~/.dotfiles/scripts/pi-off.sh' # pi

tldr() {
    curl cheat.sh/$1
}
