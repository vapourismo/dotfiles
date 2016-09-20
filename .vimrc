" lolwut?
mapclear

set nocompatible
filetype off

set hidden
set ignorecase
set smartcase
set title
set nu

set tabstop=4
set tabline=4

set backspace=indent,eol,start
set mouse=a

" Enable syntax by default
syntax on

" No idea what this does
filetype plugin on
filetype plugin indent on

" Save
noremap <C-s> <C-o>:w<CR>

" Quit
noremap <C-q> <C-o>:qa!<CR>

" Close buffer
inoremap <C-w> <C-o>:q<CR>

" Delete line
inoremap <C-k> <C-o>dd

" Duplicate line
inoremap <C-d> <C-o>yy<C-o>P<Down>
inoremap <C-d> <C-o>yy<C-o>P<Down>

" Navigation
inoremap <C-Up> <C-o>3k
inoremap <C-Down> <C-o>3j

" Window movement
inoremap <A-Left> <C-o>:wincmd h<CR>
inoremap <A-Right> <C-o>:wincmd l<CR>
inoremap <A-Up> <C-o>:wincmd k<CR>
inoremap <A-Down> <C-o>:wincmd j<CR>

" Theme
"colorscheme darkblue

" Control 
silent !stty -ixoff -ixon 2> /dev/null

au BufRead,BufNewFile * start
