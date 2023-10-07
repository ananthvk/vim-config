" Shankar VIM file 2020
" 2020-12-20
" General tips
" The default location of this file is .vim/.vimrc
" Homepage: https://github.com/shankarcodes/vim-config
" License: MIT 
"          See LICENSE for more information.
" Last modified - 2021-11-05 22:15:51
" -------------------------------------------------------------------
" ===================================================================
" Use leader + ev to open this vim config and then source it by leader + sv
" Edit this file with folding to easily go between sections.
" Remap Esc key in insert mode to jk for easier going back to insert mode
" Use 1> for indentation
" Enable folding of lines in vim scripts so that it is easier to read. Use za
" to unfold and fold.
" ====================================================================
" ====================================================================
" Use :copen and :cnext to move to errors in :make
" use zM and zR to fold and unfold all
"
scriptencoding utf-8
set encoding=utf-8
" Vim file settings {{{
" Automatic installation of vim-plug for neovim
" Taken from here https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  echom "Installing vim-plug"
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  echom "Finished installing vim-plug and plugins"
endif
augroup filetype_vim
    " For .vim (vim files) use marker foldmethod, the three curly braces.
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Remappings for easier use{{{
    let loaded_matchparen = 1
    let mapleader = " "
    " Set the leader to space bar because the default / is difficult to reach.
    " Normal mode remappings {{{
        "In normal mode, when there are many panes, horizontal and vertical, using :sp
        "and :vs these keys are easier to use to switch between the panes. Press space
        "and press the key in normal mode to switch between panes.
        nnoremap <leader>h :wincmd h<CR>
        nnoremap <leader>j :wincmd j<CR>
        nnoremap <leader>k :wincmd k<CR>
        nnoremap <leader>l :wincmd l<cr>

        " Use alt + h, j, k, l to increase and decrease the width and height of
        " panes.
        nnoremap <a-h> <c-w><
        nnoremap <a-l> <c-w>>
        nnoremap <a-k> <c-w>-
        nnoremap <a-j> <c-w>+

        nnoremap <leader>s :noh<CR>
        " Press space twice in normal mode to remove search highlights.

        nnoremap <leader>w :w!<cr>
        nnoremap <leader>q :q<cr>
        " Press leader + w to quickly save and.
        " nnoremap - ddp

        " Press - in normal mode to shift the line down by one line and paste it.
        " nnoremap _ ddkkp
        " Press - to move the current line down and _ to move the current line up
        nnoremap - :move +1<CR>
        nnoremap _ :move -2<CR>

        nnoremap <leader>up viwU
        " Useful to set words to uppercase with ctrl + u like for constants
        " MAX_CONNECTIONS instead of holding shift and pressing.

        nnoremap <leader>ve :vsplit $HOME/.vim/.vimrc<CR>
        nnoremap <leader>vs :source $HOME/.vim/.vimrc<CR>
        " Press leader + ev to edit vim quickly and press leader + sv to source
        " the file.
        " nnoremap <leader>ev :vsplit $MYVIMRC<CR>
        " Useful when you have to edit your vimrc quickly
        " Git remappings
        nnoremap <leader>ga :Git add -A<CR>
        nnoremap <leader>gc :Git commit -m "Changes"<CR>
        nnoremap <leader>gp :Git push -u origin main<CR>
        " Fold code remappings.
        nnoremap <leader>o za
        " use leader + f and b to go front and back of link in vim helps.
        nnoremap <leader>f <c-]>
        nnoremap <leader>b <c-o>

        nnoremap <leader>n :bn<CR>
        nnoremap <leader>i :bp<CR>

        nnoremap <leader>u <c-U>
        nnoremap <leader>d <c-D>

        " S will search/replace the word under the cursor
        nnoremap S :%s/\<<C-r><C-w>\>//g<Left><Left><C-r><C-w>
        " Pastes the content in the 0 register, which contains the last yanked
        " text even if other deletes are performed.
        nnoremap <leader>p "0p
        nnoremap <leader>P "0P

        nnoremap <leader>tn :tabnew<CR>
        nnoremap <leader>to :tabonly<CR>
        nnoremap <leader>tc :tabclose<CR>
        nnoremap <leader>tm :tabmove
        nnoremap <leader>t<leader>  :tabnext<CR>
" }}}
    " Insert mode remappings {{{
    inoremap jk <Esc>
    " Remap jk to Esc key so that it is easier to read
    inoremap <c-e> <c-o>A
    inoremap <c-d> <Esc>ddi
    inoremap <c-space> <c-n>
    " useful to press ctrl + d to delete the current line in insert mode.
    " }}}
    " Terminal mode {{{
    tnoremap jk <C-\><C-n>
    " }}}
    " Visual mode remappings{{{
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
    " Moves the selected text up or down
    " }}}
    " Command mode remappings{{{
    " Use this command to write to file when you forget to open with sudo.
    cmap w!! w !sudo tee > /dev/null %

    " }}}
    set mouse=a
    set clipboard+=unnamedplus
    " Allows to copy to the system clipboard
" }}}
" Plugins {{{
    " Use Vim-Plug to install the plugins
    " Use :PlugInstall
    call plug#begin('~/.vim/plugged')
    " Gruvbox a colorscheme plugin
    Plug 'morhetz/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'altercation/vim-colors-solarized'
    " Another colorscheme set it in the colors and colorscheme section
    Plug 'tpope/vim-fugitive'
    " Vim plugin for git"
    Plug 'preservim/nerdtree'
    " Vim plugin for viewing files
    Plug 'vim-airline/vim-airline'
    " Vim plugin for markdown preview.
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter'
    Plug 'flazz/vim-colorschemes'
    Plug 'lervag/vimtex'
    Plug 'sirver/ultisnips'
    " Plug 'powerman/vim-plugin-AnsiEsc'
    Plug 'honza/vim-snippets'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mhinz/vim-startify'
    Plug 'easymotion/vim-easymotion'
    " Plug 'nathanaelkane/vim-indent-guides'
    if has('nvim')
        Plug 'lukas-reineke/indent-blankline.nvim'
    endif
    " Plugin to store previous yanks and deletes.
    " Plug 'vim-scripts/YankRing.vim'
"=====================================================================
"    if has('nvim')
"        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"    else
"        Plug 'Shougo/deoplete.nvim'
"        Plug 'roxma/nvim-yarp'
"        Plug 'roxma/vim-hug-neovim-rpc'
"    endif
    call plug#end()
" }}}
" Colors and colorscheme {{{
    " Set the colorscheme and background
    " colorscheme gruvbox
    "colorscheme solarized8_dark
    "A super spatial colorscheme
    " colorscheme base16-ateliercave
    
    " The best colorscheme, which I used for a while
    " colorscheme solarized8_dark
    " colorscheme OceanicNext
    colorscheme gruvbox
    set background=dark
    " Choose the dark theme
    syntax enable
    " Enable syntax highlighting
    set wrap
    " Enable line wrapping
    set linebreak
    " Don't wrap middle of a word
    set termguicolors
    "set terminal colors
    let g:airline_powerline_fonts = 1
    set t_Co=256
    "set guifont=IBM\ Plex\ Mono:h12:cANSI:qDRAFT
    "set guifont=Roboto\ Mono:h12:cANSI:qDRAFT
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12:cANSI:qDRAFT,IBM\ Plex\ Mono:h12:cANSI:qDRAFT,Roboto\ Mono:h12:cANSI:qDRAFT
    nnoremap <F8> :AirlineTheme base16_colors<CR>

"}}}
" Spaces and tabs {{{
    set tabstop=4
    " number of visual spaces per a tab
    set softtabstop=4
    " number of spaces in insert mode
    set expandtab
    " Tabs are spaces, useful in python where spaces are preferred.
    set smarttab
    " Insert tabstop number of spaces when tab key is pressed instead of tab
    set shiftwidth=4
    " Use space instead of tab
    filetype plugin indent on
    " Indent according to the file type
    set autoindent
    " Enable auto indentation
    set shiftround
    " When inserting spaces using 1>> use a multiple of shifwidth.
    set copyindent
    " Copy previous indentation.
    nnoremap L :set list!<CR>
    set showbreak=↪\
    set listchars=tab:\ \ \\|,eol:↲,trail:•,extends:→,precedes:←
" }}}
" Search options {{{
    set hlsearch
    " Enable search highlighting when searching
    set ignorecase
    " Ignore case while searching
    set incsearch
    " Start searching for partial match
    set smartcase
    " When there is a uppercase letter in the search, make the search case
    " sensitive
    set magic
    " Allows the use of regular expressions.
" }}}
" UI options {{{
    set relativenumber number
    " Shows the relative number of a line, useful for movements with hjkl
    set showcmd
    " Show the last command entered in the bottom right.
    set cursorline
    " Highlight the current cursor line so that it is easy to read.
    set wildmenu
    " Autocomplete the command menu, that is when you type : , so a gui comes up
    " if you press tab and press tab and shift + tab to go up and down that list
    set showmatch
    " Highlight the matching paranthesis including [], {}, ()
    set noerrorbells
    " Disable beep sound on error
    set title
    " Set the window's title based on the filename
    " Peformance options
    set lazyredraw
    " don't update screen during macro execution
    set ttyfast
    set hidden
    " To hide the files in background instead of closing them
    set history=1000
    " Increase the undolimit to 1000
    set ruler
    " Sets the ruler, the line and column number display
    set confirm
    " Ask for confirmation when closing a unsaved file
    set nocp
    " Dont behave in compatible vim mode
    set laststatus=2
    " Always show the status bar.
    " cnoreabbrev help vert help
    set splitright
    cnoremap help vert help 
" }}}
" Create folders for file options {{{
    if !isdirectory($HOME. "/.vim/undodir")
        call mkdir($HOME. "/.vim/undodir", "p")
    endif

    if !isdirectory($HOME. "/.vim/cache")
        call mkdir($HOME. "/.vim/cache", "p")
    endif

    if !isdirectory($HOME. "/.vim/backup")
        call mkdir($HOME. "/.vim/backup", "p")
    endif

" }}}
" General file options, undo, directory, etc. {{{
    set undodir=~/.vim/undodir
    " Set the undo directory
    set undofile
    " use persistent undo
    set undolevels=1000
    " Use 1000 undo levels
    set undoreload=10000
    " Store 10000 lines
    set directory=~/.vim/cache
    " Store all the swapfiles
    set backup
    set backupdir=~/.vim/backup
    " Store the backups.
    set updatetime=350
    " Set the update time for plugins
    set noerrorbells vb t_vb=
    au GUIEnter * set vb t_vb=
" }}}
" Pane options {{{
    set splitbelow
    " Splits the pane below
" }}}
" Misc {{{
    noremap <leader>mm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
    " Remove the Windows ^M - when the encodings gets messed up
    nnoremap <leader>ms :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
    " Remove trailing whitespaces
    set shortmess=aI
    set encoding=utf-8
    " Set the encoding to unicode
    set ffs=unix,dos,mac
    "Set unix as default file type
    set wildignore+=*jpg,*.png,*.bmp,*.gif,*.mp4,*.mkv,*.avi,*.mov,*.mp3,*.ogg
    set wildignore+=*.pdf,*.docx,*.doc,*.xls,*.xlsx,*.ppt,*.pptx
    set wildignore+=*.zip,*.rar,*.7z,*.tar,*.tar.gz,*.tar.xz,*.iso
    set wildignore+=*.db,*.sqlite3,*.sqlite
    set wildignore+=*.exe,*.EXE,*.dll,*.DLL,*.so,*.class,*.o,*.a,*.sys,*.SYS,*.bak,*.lib,*.LIB
    set wildignore+=*.msc,*.MSC,*.NLS,*.nls,*.bin,*.BIN,*.dat,*.DAT,*.acm,*.ocx,*.Exe,*.cpl,*.ax
    set wildignore+=*.pyc,*.pyo
    set wildignore+=*.xnb
" }}}
" Abbreviations {{{
iabbrev adn and
iabbrev gpath <C-r>=expand('%:p')<CR>
iabbrev gdate <C-r>=strftime('%F')<CR>
iabbrev gtime <C-r>=strftime('%H:%M:%S')<CR>
iabbrev gdt <C-r>=strftime('%F %H:%M:%S')<CR>
iabbrev teh the
iabbrev tehn then
" }}}
" Functions {{{

"function! Get_visual_selection()
" This function is taken from http://stackoverflow.com/a/6271254/794380
" Why is this not a built-in Vim script function?!
"let [lnum1, col1] = getpos("'<")[1:2]
"let [lnum2, col2] = getpos("'>")[1:2]
"let lines = getline(lnum1, lnum2)
"let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)] 
"let lines[0] = lines[0][col1 - 1:] 
"let selection = join(lines,'\n')
"let change = input('Change the selection with: ')
"execute ":%s/".selection."/".change."/g"
"endfunction

function! Get_visual_selection()
let [lnum1, col1] = getpos("'<")[1:2]
let [lnum2, col2] = getpos("'>")[1:2]
let lines = getline(lnum1, lnum2)
let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)] 
let lines[0] = lines[0][col1 - 1:] 
let line_move= join(lines,'\n')
return line_move
endfunction

" }}}
" Vimtex settings {{{
let g:tex_flavor='latex'
" Change this to some other reader
" let g:vimtex_view_method=''
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" }}}
" Ulti Snips settings {{{
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
" Lists snippets
let g:UltiSnipsListSnippets="<c-l>"

" This is the directory to store user created snippets
" using :UltiSnipsEdit
let g:UltiSnipsSnippetsDir="~/.vim/snips"
" The below line actually works, the above one is found in the internet.
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit="~/.vim/snips"
" These are folders to search snippets for.
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]

"Enable auto start of deoplete
" let g:deoplete#enable_at_startup=1
" let g:python3_host_prog='C:\\Program Files\\Python39\\python.exe'
" Enable completion for vimtex
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})
" }}}
" Other plugin settings{{{
" ctrlp.vim settings
    let g:ctrlp_map = '<c-f>'
    let g:ctrlp_cmd = 'CtrlP'
" vim-startify settings
    let g:startify_session_dir = '~/.vim/session'
" indent-blankline.nvim
    nnoremap H :IndentBlanklineToggle<CR>
"}}}
" Generates a lorem for testing
let g:vimrc_location=expand("<sfile>:p:h")
iabbrev lorem <c-o>:execute ':r ' . vimrc_location . '/templates/LOREM'<CR>
nnoremap <F5> :UndotreeToggle<CR>
"=====================================================================
"echom ">^.^<"
