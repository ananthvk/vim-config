# ShankarCodes (Shankar) Vim files 2020
For help see [HELP.md](./HELP.md)\
This repository's url [https://github.com/ShankarCodes/vim-config](https://github.com/ShankarCodes/vim-config)
# Screenshots
![Sample](./screenshot/1.png)
# Installation
Download the .vimrc from this repository.\
Install [vim plug](https://github.com/junegunn/vim-plug)
Place the .vimrc in your .vim folder.\
Follow the given instructions and run :PlugInstall on opening vim.\
Preffered Font IBM Plex Mono.\
Get it from here [IBM Plex Mono](https://github.com/IBM/plex)\
Install powerline fonts for the status bar from [here](https://github.com/powerline/fonts)\
If you want to have nvim-qt in full screen mode add the ginit.vim to the appropriate folder.
# Windows
### For nvim users
Place the below lines in %LOCALAPPDATA%\Local\nvim\init.vim
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/.vimrc
```
### For vim users
Place the below line in your $HOME\.vimrc
```
source ~/.vim/.vimrc
```
## \*nix
### For nvim users
Place the below lines in ~/.config/nvim/init.vim
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/.vimrc
```
### For vim users
Place the below line in your $HOME/.vimrc
```
source ~/.vim/.vimrc
```
# LICENSE
Licensed under the MIT license.
See LICENSE for more information.
