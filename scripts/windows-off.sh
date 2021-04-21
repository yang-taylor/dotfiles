report() {
	if [ $1 -eq 0 ]; then
		echo '${2} ==> updated! :)'
	else
		echo '${2} ==> failed :('
	fi
}

cup all

choco list --local-only >| ~/.dotfiles/packages/choco-list.txt
report $? 'choco'

code --list-extensions >| ~/.dotfiles/packages/vscode-extensions.txt
report $? 'vscode'

npm update -g 
npm list -g --depth=0 >| ~/.dotfiles/packages/npm-pkglist.txt 
report $? 'npm'

for i in $(pip list -o | awk 'NR > 2 {print $1}'); do pip install -U $i; done
pip list --not-required >| ~/.dotfiles/packages/pip-pkglist.txt
report $? 'pip'

# cp ~/AppData/Roaming/Code/User/settings.json settings.json && echo "vscode settings.json: updated" || echo "vscode settings.json: failed :("

fmtdate="$(date +%m/%d)"
message="[${fmtdate}]"


cd ~/.dotfiles
	git add -A
	git status
	~/.dotfiles/scripts/./commit.sh
	report $? 'dotfiles'

echo "shutdown in progress. shutdown /a to cancel"
shutdown /s
