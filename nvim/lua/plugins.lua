-- install packer if it hasn't been installed yet
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- auto compile
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

local packer = require('packer')

packer.init({
  -- compile_path seems to be broken now
  -- compile_path = vim.fn.stdpath('data'),
  opt_default = false
})

-- load plugins
packer.startup(function(use)
  -- packer can manage itself
  use { 'wbthomason/packer.nvim', opt = false }

  -- libraries, depedencies for other plugins
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'kabouzeid/nvim-lspinstall' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'simrat39/symbols-outline.nvim' }

  -- completion
  use { 'hrsh7th/nvim-compe', event = 'InsertCharPre', config = require('plugin-config/completion').setup }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'p00f/nvim-ts-rainbow' }

  -- telescope
  use { 'nvim-telescope/telescope.nvim' }

  -- file explorer
  use { 'ptzz/lf.vim' }
  use { 'voldikss/vim-floaterm' }

  -- git
  use { 'airblade/vim-gitgutter', event = 'VimEnter' }
  use { 'tpope/vim-fugitive', cmd = {'G', 'Git'} }
  use { 'rbgrouleff/bclose.vim' }
  use { 'iberianpig/tig-explorer.vim' }

  -- colorscheme
  use { 'RRethy/nvim-base16' }

  -- text objects/motions
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-surround' }

  -- misc
  use { 'Yggdroot/indentLine' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'christoomey/vim-tmux-navigator' }
end
)

