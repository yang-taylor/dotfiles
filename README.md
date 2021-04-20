# dotfiles: getting started

### Clone the repository in a `.dotfiles` directory:
`git clone https://github/tayleyi/dotfiles .dotfiles`

---

### Windows:
1. #### first, install cygwin
2. #### in the cygwin terminal:
```
$ ln -s /cygdrive/c/Users/taylor/.dotfiles/windows/.bashrc /home/taylor/.bashrc
$ source ~/.bashrc
$ cd ~
$ cp ./dotfiles/windows/.vimrc .vimrc
```

---

### Linux:
 ```
 $ cd .dotfiles/scripts
 $ chmod +x config.sh
 $ ./config.sh
 ```
