## cygwin ~/.bashrc

[[ "$-" != *i* ]] && return

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export HOME=/cygdrive/c/Users/taylor
cd $HOME
export github=git@github.com:tayleyi
export gitlab=git@gitlab.com:tayleyi

export PS1="\n\[$(tput setaf 5)\]\A \[$(tput setaf 1)\][\u] \n\[$(tput setaf 6)\][\w] \$(tput sgr0)\]\$(parse_git_branch)\n"


shopt -s autocd
set -o noclobber

alias :q='cd ..'
alias ls='ls --color=auto -al'
alias add='git add -A && git status'
alias commit='bash $HOME/.dotfiles/scripts/commit.sh'
alias create='bash $HOME/.dotfiles/scripts/create.sh'
alias off='bash $HOME/.dotfiles/scripts/windows-off.sh' # windows

tldr() {
    curl cheat.sh/$1
}
