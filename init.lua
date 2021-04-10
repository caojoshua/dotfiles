-- source original .vimrc
local o = vim.o
-- TODO: setting runtimepath in lua is not expanding the `~`, using vimscript for now
-- o.runtimepath = '~/.vim,' .. o.runtimepath
-- o.runtimepath = o.runtimepath .. ',~/.vim/after'
vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after')
o.packpath = o.runtimepath
vim.cmd('source ~/.vimrc')

-- LSP
local lsp_attach = function(client, bufnr)
  local function set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  local function set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- autocomplete
  require('completion').on_attach(client, bufnr)

  -- mappings
  local prefix = '\\'
  local opts = { noremap=true, silent=true }

  set_keymap('n', prefix .. 'D', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  set_keymap('n', prefix .. 'd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  set_keymap('n', prefix .. 'h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  set_keymap('n', prefix .. 'i', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  set_keymap('n', prefix .. 'r', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  set_keymap('n', prefix .. 'R', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

require('lspconfig').clangd.setup{ on_attach=lsp_attach }
require('lspconfig').tsserver.setup{ on_attach=lsp_attach }

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = { enable=true },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}

-- misc
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')
