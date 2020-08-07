
set nocompatible

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'universal-ctags/ctags'
Plug 'portante/cscope'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/NERDTree', {'on': 'NERDTreeToggle'}
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ycm-core/YouCompleteMe', {'on': 'Foo'}
call plug#end()

" plugin global variables

let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py"
" let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<TAB>', 'C-n']
let g:ycm_key_list_previous_completion = ['<S-TAB>', 'C-n']

filetype indent plugin on
syntax on

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

" misc
set autoread
set background=dark
set hidden
set laststatus=2
set ruler
set wildmenu


" mappings
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
nnoremap <leader>af :Autoformat<CR>

" cscope
if filereadable("cscope.out")
  cs add cscope.out
endif
nnoremap <C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>

" ycm
nnoremap <leader>yg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>

" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ft :Tags<CR>

" grep
nnoremap <leader>g :grep 
nnoremap <leader>gc :grep <cword> . -r<CR><CR>

" quickfix-window
" :help quickfix-window
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>


