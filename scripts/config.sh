#!/bin/bash

###
mv ~/dotfiles ~/.dotfiles
echo "running setup script..."

### set up bash
cp ~/.dotfiles/.bash_profile ~/.bash_profile && \
	echo 'bash_profile ==> success!' || echo 'bash_profile ==> failed :('
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases && \
	echo 'bash_aliases ==> success!' || echo 'bash_aliases ==> failed :('
ln -sf ~/.dotfiles/.bashrc ~/.bashrc && \
	echo 'bashrc ==> success!' || echo 'bashrc ==> failed :('
source ~/.bashrc

### set up vim and emacs
ln -s ~/.dotfiles/.vimrc ~/.vimrc && \
	echo 'vimrc ==> success!' || echo 'vimrc ==> failed :('
ln -s ~/.dotfiles/.emacs ~/.emacs && \
	mkdir .emacs.d && \
	ln -s ~/.dotfiles/lisp ~/.emacs.d/lisp && \
	echo 'emacs ==> success!' || echo 'emacs ==> failed :('

### set up i3
ln -sf ~/.dotfiles/i3/config ~/.config/i3/config && \
	echo 'i3 ==> success!' || echo 'i3 ==> failed :('

### set up alacritty
mkdir ~/.config/alacritty && \
	ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml && \
	echo 'alacritty ==> success!' || echo 'alacritty ==> failed :('

### set up scripts
chmod +x ~/.dotfiles/scripts/on.sh && \
	echo 'script: on ==> success!' || echo 'script: on ==> failed :('
chmod +x ~/.dotfiles/scripts/off.sh && \
	echo 'script: off ==> success!' || echo 'script: off ==> failed :('
chmod +x ~/.dotfiles/scripts/texmk.sh && \
	echo 'script: texmk ==> success!' || echo 'script: texmk ==> failed :('
chmod +x ~/.dotfiles/scripts/create.sh && \
	echo 'script: create ==> sucess!' || echo 'script: create ==> failed :('
chmod +x ~/.dotfiles/scripts/scanned_pdf.sh && \
	echo 'script: scanned_pdf ==> success!' || echo 'script: scanned_pdf ==> failed :('
chmod +x ~/.dotfiles/scripts/commit.sh && \
	echo 'script: commit ==> success!' || echo 'script: commit ==> failed :('

### set up git
ln -s ~/.dotfiles/git-configs/.gitignore_global ~/.gitignore_global && \
touch ~/.gitmessage.txt && \
git config --global user.name "taylor y" && \
git config --global user.email "64106592+tayleyi@users.noreply.github.com" && \
git config --global pull.rebase false && \
git config --global fetch.prune true && \
git config --global core.editor vim && \
git config --global core.excludesfile ~/.gitignore_global && \
git config --global help.autocorrect 50 && \
git config --global core.autocrlf input && \
git config --global commit.template ~/.gitmessage.txt && \
echo 'git ==> success!' || echo 'git ==> failed :('

# nerd fonts: Iosevka, VictorMono, FiraCode, Space Mono, Ubuntu Mono, Fira Mono, Monoid
# other fonts: Sometype Mono (on Dharma Type), sudo (by jenskutilek), JetBrains Mono, Inter (by rsms)
# chrissimpkins codeface: droid sans mono, cousine, monospace typewriter, office-code-pro
# google fonts: roboto condensed, montserrat, source code pro, oswald, bebas neue, abel, ibm plex sans, questrial, archivo, archivo naarro, overpass, jost, karma, noto serif tc, pontano sans, saira semi condensed, lexend deca, playfair display, red hat display, libre barcode 39 text, alegreya sans sc, voltaire, carrois gothic sc

###
# ssh-keygen -t ed25519 -C "email"
# ssh-add ~/.ssh/id_ed25519
