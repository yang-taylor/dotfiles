#!/bin/bash

echo "running setup script..."

report() {
	if [ $1 -eq 0 ]; then
		echo '${2} ==> success! :)'
	else
		echo '${2} ==> fail :('
	fi
}



### set up bash
cp ~/.dotfiles/.bash_profile ~/.bash_profile
report $? 'bash_profile'
	
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases 
report $? 'bash_aliases'
	
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
report $? 'bashrc'
source ~/.bashrc



### set up vim and emacs
ln -s ~/.dotfiles/.vimrc ~/.vimrc
report $? 'vimrc'

ln -s ~/.dotfiles/.emacs ~/.emacs && \
mkdir .emacs.d && ln -s ~/.dotfiles/lisp ~/.emacs.d/lisp
report $? 'emacs'



### set up i3
ln -sf ~/.dotfiles/i3/config ~/.config/i3/config
report $? 'i3'



### set up alacritty
mkdir ~/.config/alacritty
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
report $? 'alacritty'



### set up redshift
mkdir ~/.config/redshift
ln -s ~/.dofiles/redshift.conf ~/.config/redshift/redshift.conf
report $? 'redshift'



### set up scripts
chmod +x ~/.dotfiles/scripts/on.sh &&
report $? 'script: on'

chmod +x ~/.dotfiles/scripts/off.sh 
report $? 'script: off'

chmod +x ~/.dotfiles/scripts/texmk.sh
report $? 'script: texmk'

chmod +x ~/.dotfiles/scripts/create.sh 
report $? 'script: create'

chmod +x ~/.dotfiles/scripts/scanned_pdf.sh 
report $? 'script: scannedpdf'

chmod +x ~/.dotfiles/scripts/commit.sh 
report $? 'script: commit'



### set up git
touch ~/.gitmessage.txt && \
cp ~/.dotfiles/.gitconfig ~/.gitconfig
# git config --global commit.template ~/.gitmessage.txt && \
# git config --global user.name "taylor yang" && \
# git config --global user.email "64106592+tayleyi@users.noreply.github.com" && \
# git config --global pull.rebase false && \
# git config --global fetch.prune true && \
# git config --global core.editor vim && \
# git config --global core.excludesfile ~/.dotfiles/.gitignore_global && \
# git config --global help.autocorrect 30 && \
# git config --global core.autocrlf input
report $? 'git'

## install arch official packages
while read package; do
	sudo pacman -S $package
done < ~/.dotfiles/packages/arch-pkglist.txt

## install vscode extensions
while read extension; do
	code --install-extension $extension --force
done < ~/.dotfiles/packages/vscode-extensions.txt

## install emacs extensions

# nerd fonts: Iosevka, VictorMono, FiraCode, Space Mono, Ubuntu Mono, Fira Mono, Monoid
# other fonts: Sometype Mono (on Dharma Type), sudo (by jenskutilek), JetBrains Mono, Inter (by rsms)
# chrissimpkins codeface: droid sans mono, cousine, monospace typewriter, office-code-pro
# google fonts: roboto condensed, montserrat, source code pro, oswald, bebas neue, abel, ibm plex sans, 
	# questrial, archivo, archivo naarro, overpass, jost, karma, noto serif tc, pontano sans, saira semi condensed, 
	# lexend deca, playfair display, red hat display, libre barcode 39 text, alegreya sans sc, voltaire, carrois gothic sc
rt url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css");
