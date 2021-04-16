cup all

choco list --local-only > ~/.dotfiles/choco.txt && echo "choco package list: updated!" || echo "choco package list: failed :("

code --list-extensions > ~/.dotfiles/extensions.txt && echo "vscode extensions: updated" || echo "vscode extendsions: failed :("

npm update -g && npm list -g --depth=0 > ~/.dotfiles/npm.txt && echo "npm: updated" || echo "npm: failed :("


for i in $(pip list -o | awk 'NR > 2 {print $1}'); do pip install -U $i; done
pip list --not-required >> ~/.dotfiles/pip.txt && echo "pip: updated" || echo "pip: failed :("

# cp ~/AppData/Roaming/Code/User/settings.json settings.json && echo "vscode settings.json: updated" || echo "vscode settings.json: failed :("

fmtdate="$(date +%m/%d)"
message="[${fmtdate}]"


cd ~/.dotfiles
	git add -A
	git status
	read -p "commit message for dotfiles: " dotinput
	dotmsg="${message} ${dotinput}"
	git commit -m "${dotmsg}" && echo "learn commited: ${dotmsg}"
	git pull
	git push || echo "dotfiles cannot be pushed"

echo "shutdown in progress. shutdown /a to cancel"
shutdown /s
