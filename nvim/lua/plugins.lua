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
  opt_default = false,
  git = {
    depth = 500,
  },
})

-- load plugins
packer.startup(function(use)
  -- packer can manage itself
  use { 'wbthomason/packer.nvim', opt = false }

  -- libraries, depedencies for other plugins
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  -- LSP
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'simrat39/symbols-outline.nvim' }

  -- language specific
  use { 'mfussenegger/nvim-jdtls' }

  -- completion
  use { 'hrsh7th/cmp-buffer'}
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/nvim-cmp'}

  -- snippets
  use { 'rafamadriz/friendly-snippets' } -- snippets collection
  use { 'L3MON4D3/LuaSnip' } -- snippets engine

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'nvim-treesitter/playground' }
  use { 'p00f/nvim-ts-rainbow' }

  -- debugging
  use { 'mfussenegger/nvim-dap' }
  use { "Pocco81/DAPInstall.nvim" }
  use { 'rcarriga/nvim-dap-ui' }

  -- telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- file explorer
  use { 'ptzz/lf.vim' }
  use { 'voldikss/vim-floaterm' }

  -- git
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }
  use { 'rbgrouleff/bclose.vim' }
  use { 'iberianpig/tig-explorer.vim' }

  -- colorscheme
  use { 'RRethy/nvim-base16' }

  -- text objects/motions
  use { 'phaazon/hop.nvim' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-surround' }

  -- misc
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'ntpeters/vim-better-whitespace' }
  use { 'rmagatti/auto-session' }
  use { 'tpope/vim-sleuth' }
  use { 'christoomey/vim-tmux-navigator' }
end
)
