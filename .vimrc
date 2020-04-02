set nocompatible

"Change leader to ,
let mapleader = ","
let g:mapleader = ","

"show when leader is pressed
set showcmd

syntax enable
filetype plugin on

set tabstop=2
set textwidth=80
set shiftwidth=2
set noexpandtab
set autoindent

set hidden "Allow hiding buffers that aren't saved

"expanding certain file types
"au BufRead,BufNewFile *.py set expandtab
"au BufRead,BufNewFile *.c set expandtab
"au BufRead,BufNewFile *.h set expandtab
"au BufRead,BufNewFile makefile* set expandtab

set backspace=indent,eol,start

set ruler
set colorcolumn=80
highlight ColorColumn ctermbg=lightcyan guibg=lightgrey

set path+=**

set wildmenu ":Find <tab> autocomplete for file in sub directories

set tags=tags;/
command! MakeTags !ctags -R .

"Once tags are created, c^] to jump to tag under cursor
"Use gc^] for ambiguous tags
"use c^t to jump up tag stack

"Autocomplete works out of the box. c^n to start autocomplete and c^p to go up
"the list. 

let g:netrw_banner=0	"disable banner
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

":edit <folder> to open file browser

nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==

inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

"Paste from system clipboard
nnoremap <C-c> "*p

"Delete, don't cut
nnoremap d "_d
nnoremap D "_D

"Cut
nnoremap <Leader>d "ddd
nnoremap <Leader>D ""D

"Quickly get to shell
nnoremap <Leader>a :sh<cr>

"Quickly save
nnoremap <Leader>s :update<cr>

"jj to exit normal
inoremap jj <ESC>
