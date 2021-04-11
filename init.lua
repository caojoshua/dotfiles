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

  require('lsp_signature').on_attach()

  -- mappings
  local prefix = '\\'
  local opts = { noremap=true, silent=true }

  set_keymap('n', prefix .. 'c', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  set_keymap('n', prefix .. 'D', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  set_keymap('n', prefix .. 'd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  set_keymap('n', prefix .. 'h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  set_keymap('n', prefix .. 'i', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  set_keymap('n', prefix .. 'r', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  set_keymap('n', prefix .. 'R', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

  set_keymap('n', prefix .. '[', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  set_keymap('n', prefix .. ']', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

require('lspconfig').clangd.setup{ on_attach=lsp_attach }
require('lspconfig').tsserver.setup{ on_attach=lsp_attach }

-- treesitter
require('nvim-treesitter.configs').setup {
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

-- completion
require'compe'.setup {
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

-- map with vim for now because compe be like that: https://github.com/hrsh7th/nvim-compe/issues/25
-- also compe#scroll seems to be broken
vim.cmd([[
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-c>     compe#close('<C-c>')
]])

-- telescope
telescope_key_prefix = [[<leader>f]]
telescope_binding_prefix = [[<Cmd>lua require('telescope.builtin').]]
telescope_binding_postfix = [[<Cr>]]
local function set_tele_keymap(key, binding)
  vim.api.nvim_set_keymap('n',
                          telescope_key_prefix .. key,
                          telescope_binding_prefix .. binding .. telescope_binding_postfix,
                          { noremap = true })
end

set_tele_keymap('f', 'find_files()')
set_tele_keymap('g', 'live_grep()')
set_tele_keymap('b', 'buffers()')
set_tele_keymap('\'', 'marks()')
set_tele_keymap('r', 'registers()')
set_tele_keymap('q', 'quickfix()')
set_tele_keymap('e', 'command_history()')
set_tele_keymap('o', 'vim_options()')
set_tele_keymap('k', 'keymaps()')
set_tele_keymap('m', 'man_pages()')
set_tele_keymap('h', 'help_tags()')
set_tele_keymap('c', 'lsp_code_actions()')
set_tele_keymap('d', 'lsp_workspace_diagnostics()')

-- colorscheme
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')
