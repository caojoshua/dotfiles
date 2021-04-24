local util = require('util')

local prefix = '\\'
local opts = { noremap=true, silent=true }

local lsp_attach = function(client, bufnr)
  -- TODO: disabled virtual text so this isn't working
  -- maybe just remove this plugin ... its not necessary
  require('lsp_signature').on_attach()

  -- mappings
  -- TODO: consider using Telescope LSP pickers instead
  local function set_keymap(key, map)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', prefix .. key, util.lua_cmd(map), opts)
  end

  set_keymap('c', 'vim.lsp.buf.code_action()')
  set_keymap('D', 'vim.lsp.buf.declaration()')
  set_keymap('d', 'vim.lsp.buf.definition()')
  set_keymap('h', 'vim.lsp.buf.hover()')
  set_keymap('i', 'vim.lsp.buf.implementation()')
  set_keymap('r', 'vim.lsp.buf.references()')
  set_keymap('R', 'vim.lsp.buf.rename()')

  set_keymap('e', 'vim.lsp.diagnostic.show_line_diagnostics()')
  set_keymap('E', 'vim.lsp.diagnostic.set_loclist()')
  set_keymap('[', 'vim.lsp.diagnostic.goto_prev()')
  set_keymap(']', 'vim.lsp.diagnostic.goto_next()')

  -- diagnostics settings
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = {
        priority = 1000
      }
    }
  )

end

require('lspconfig').clangd.setup{ on_attach=lsp_attach }
require('lspconfig').tsserver.setup{ on_attach=lsp_attach }

-- vim vista
-- open vista for LSP if the buffer is attached to a LSP client. otherwise, fallback to vista ctags
vista = function()
  if next(vim.lsp.buf_get_clients()) == nil then
    vim.cmd('Vista ctags')
  else
    vim.cmd('Vista nvim_lsp')
  end
end
util.set_normal_keymap('<leader>\\\\', util.lua_cmd('vista()'))
