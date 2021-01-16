
# Help for my vim files
# This is for NeoVim
### Author: ShankarCodes(Shankar)
### Date:   2020-12-22

## Remappings
**Note the alt remappings seem to work only on neovim**\
Leader key is the key which is defined as mapleader, default is `<space>`
It will be represented as `<leader>`
### Normal Mode
* `<leader>+h` Move to the split to the left.
* `<leader>+l` Move to the split to the right.
* `<leader>+j` Move to the split to the bottom.
* `<leader>+k` Move to the split to the top.
* `Alt+h` Decrease the width of the split same as `Ctrl + w + <`.
* `Alt+l` Increase the width of the split same as `Ctrl + w + >`.
* `Alt+j` Increase the heigth of the split same as `Ctrl + w + +`.
* `Alt+k` Decrease the height of the split same as `Ctrl + w + -`.
* `<leader><space>` Removes highlighting text after search.
* `-` Moves the current line down by one line.
* `_` Moves the current line up by one line.
* `Ctrl+u` Makes the current word uppercase.
* `<leader>w` Forcefully saves the current buffer.
* `<leader>ga` Git add all files
* `<leader>gc` Git commit changes
* `<leader>gp` Git push to origin master.
* `<leader>n` Folds and unfolds.
* `<leader>vs` Vim source (source this .vimrc file)
* `<leader>ve` Vim edit (quickly opens up this .vimrc file
* `<leader>f` Go forward a link, especially in vim help.
* `<leader>b` Go backward a link, especially in vim help.
### Insert mode
* `jk` Equivalent to pressing.`<Esc>`
* `Ctrl + d` Delete the current line.

### Tips from various sources -- to remember
* `"_d ` Deletes without adding it to the buffer so that the yanks do not get replaced.
* `q:` Gets the buffer containing all commands to execute the command press Enter key. 
* `g <C-g>` Gets the count of characters(bytes), words, lines in the file.

