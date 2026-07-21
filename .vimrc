" To install run: 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" The only plugin I need is for the only theme that doesn't make me nauseous.
"
"

let history=500

filetype plugin on
filetype indent on

set encoding=utf8

" only for fast saving
let mapleader = ","
nmap <leader>w :w!<cr>

call plug#begin()

Plug 'morhetz/gruvbox'

call plug#end()

" visual
set background=dark
colorscheme gruvbox
set number
set relativenumber
set hlsearch
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Maps btw
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

