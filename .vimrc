filetype indent plugin on
syntax on

" ---------- Startup Script ----------
let s:swp_dir = $HOME . "/.vim/swap"
if empty(glob(s:swp_dir))
  call mkdir(s:swp_dir, "p", 0700)
endif


" ---------- Options ----------

" don't attempt to be compatible with vi
set nocompatible

" allow project specific .vimrc
set exrc
set secure

" search settings
set incsearch
set ignorecase
set smartcase

" indent settings
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" line numbering
set number
set relativenumber

" backups
let &dir = s:swp_dir
set swapfile

" misc
set autoread
set background=dark
set completeopt=menuone,noselect
set hidden
set laststatus=2
set ruler
set termguicolors
set wildmenu

" statusline
set statusline=
set statusline+=%f
set statusline+=%=
set statusline+=%m
set statusline+=\ %l:%c


" ---------- mappings ----------
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader><BS> :q<CR>
