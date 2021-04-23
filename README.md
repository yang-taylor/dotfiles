# getting started

### Clone the repository into a `.dotfiles` directory:
`git clone https://github/tayleyi/dotfiles .dotfiles`

---

### Windows:
1. #### first, install cygwin
2. #### in the cygwin terminal:
```
$ ln -s /cygdrive/c/Users/taylor/.dotfiles/windows/.bashrc /home/taylor/.bashrc
$ cp ~/.dotfiles/windows/.vimrc ~/.vimrc
$ cp ~/.dotfiles/.gitconfig ~/.gitconfig
```

---

### Linux:
 ```
 $ cd .dotfiles/scripts
 $ chmod +x config.sh
 $ ./config.sh
 ```
