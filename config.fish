function fish_prompt
	set_color $fish_color_cwd
	printf '[%s] %s \n[%s]\n' (date +%H:%M) (whoami)  (pwd) 
	set_color normal 
end

alias list="exa --color=auto -alF"
alias tree="exa --tree"
alias push="git push"
alias commit="git commit -m"
alias add="git add -A"
alias storage="df -h"
alias off="~/./off.sh"
alias texmk="~/./texmk.sh"

thefuck --alias | source

setxkbmap -option caps:escape_shifted_capslock

export HOME=/home/taylor
