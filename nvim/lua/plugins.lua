local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- libraries, depedencies for other plugins
  'nvim-lua/plenary.nvim',
  'nvim-neotest/nvim-nio',
  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'ray-x/lsp_signature.nvim',
  'stevearc/aerial.nvim',
  -- language specific
  {
    'folke/lazydev.nvim',
    ft = "lua"
  },
  -- completion
  'hrsh7th/cmp-buffer',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  -- snippets
  'rafamadriz/friendly-snippets', -- snippets collection
  'L3MON4D3/LuaSnip',             -- snippets engine
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = False
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/playground',
  'hiphish/rainbow-delimiters.nvim',
  -- debugging
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  -- telescope
  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  -- file explorer
  'ptzz/lf.vim',
  'voldikss/vim-floaterm',
  -- git
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',
  -- colorscheme
  'RRethy/nvim-base16',
  -- text objects/motions
  'phaazon/hop.nvim',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  -- misc
  'stevearc/conform.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'ntpeters/vim-better-whitespace',
  'rmagatti/auto-session',
  'tpope/vim-sleuth',
})
