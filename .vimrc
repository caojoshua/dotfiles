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
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'RRethy/nvim-base16'
  Plug 'hrsh7th/nvim-compe'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'liuchengxu/vista.vim'
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

" ---------- Plugin global vars and mappings ----------

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
let g:indentLine_char = '│'

" rainbow
let g:rainbow_active = 1

" tagbar
let g:tagbar_position = "bottom"
let g:tagbar_sort = 0
let g:tagbar_foldlevel = 0
let g:tagbar_show_linenumbers = 2
nnoremap <leader>tb :TagbarOpen f j<CR>
