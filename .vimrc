" ---------- Plugins ----------
" vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'preservim/NERDTree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-obsession'
Plug 'luochen1990/rainbow'
Plug 'jremmen/vim-ripgrep'
Plug 'majutsushi/tagbar'
Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'christoomey/vim-tmux-navigator'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
endif
call plug#end()

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
" :help tabstop for recommended settings
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
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
set completeopt=menu,noinsert,noselect
set hidden
set laststatus=2
set ruler
set wildmenu

" statusline
set statusline=
set statusline+=%f
set statusline+=%=
set statusline+=%m
set statusline+=\ %l:%c


" ---------- mappings ----------
let mapleader = " "

" window mapping
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap - :split<CR>
nnoremap <Bar> :vsplit<CR>

" normal mapping shotcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>rg :Rg<Space>
nnoremap <leader>af :Autoformat<CR>

" quickfix-window
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>


" ---------- Plugin global vars and mappings ----------

" ale
" disable by default
let g:ale_disable_lsp = 1

" cscope
nnoremap <C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>

" easy motion
nmap , <Plug>(easymotion-prefix)

" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ft :Tags<CR>

" indentLine
let g:indentLine_char = '┊'

" rainbow
let g:rainbow_active = 1

" tagbar
let g:tagbar_position = "bottom"
let g:tagbar_sort = 0
let g:tagbar_foldlevel = 0
let g:tagbar_show_linenumbers = 2
nnoremap <leader>tb :TagbarOpen f j<CR>
