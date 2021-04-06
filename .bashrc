# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\n\[$(tput setaf 5)\]\A \[$(tput setaf 1)\][\u] \n\[$(tput setaf 6)\][\w]\$(tput sgr0)\]\$(parse_git_branch)\n"

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

setxkbmap -option caps:escape_shifted_capslock

## backup command: (from /home)
##		sudo zip -r sdb/[date].zip taylor/* -r

# backup: dd if=/dev/disk | gzip > path.gz
# recovery: gzip -dc path.gz | dd of=/dev/disk

shopt -s autocd
set -o noclobber

export HOME=/home/taylor
export EDITOR=vim
eval "$(thefuck --alias)"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin:$HOME/.local/bin"
export github=git@github.com:taylory-xyz
