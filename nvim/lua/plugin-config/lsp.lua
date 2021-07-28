local util = require('util')

local prefix = '\\'
local opts = { noremap=true, silent=true }

local lsp_attach = function(client, bufnr)
  require('lsp_signature').on_attach()

  -- mappings
  -- TODO: consider using Telescope LSP pickers instead
  local function set_keymap(key, map)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', prefix .. key, util.lua_cmd(map), opts)
  end

  set_keymap('c', 'vim.lsp.buf.code_action()')
  set_keymap('D', 'vim.lsp.buf.declaration()')
  set_keymap('d', 'vim.lsp.buf.definition()')
  set_keymap('f', 'vim.lsp.buf.formatting()')
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

  require('aerial').on_attach(client)

  vim.g.aerial = {
    manage_folds = false,
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Method",
      "Struct",
    }
  }
  util.set_normal_buf_keymap(bufnr, '<leader>tt', util.lua_cmd([[require('aerial').toggle(true)]]))
  util.set_normal_buf_keymap(bufnr, '<leader>t[', util.lua_cmd([[require('aerial').prev()]]))
  util.set_normal_buf_keymap(bufnr, '<leader>t]', util.lua_cmd([[require('aerial').next()]]))
  util.set_normal_buf_keymap(bufnr, '<leader>t{', [[<cmd>AerialPrevUp<cr>]])
  util.set_normal_buf_keymap(bufnr, '<leader>t}', [[<cmd>AerialNextUp<cr>]])
end

-- manually installed LSP servers
require('lspconfig').clangd.setup{ on_attach=lsp_attach }
require('lspconfig').tsserver.setup{ on_attach=lsp_attach }

-- LSP servers installed through nvim-lspinstall. Important to execute lspinstall setup after
-- setting up manually installed servers.
require('lspinstall').setup()
require('lspconfig').java.setup{ on_attach=lsp_attach }
require('lspconfig').lua.setup{ on_attach=lsp_attach }
require('lspconfig').python.setup{ on_attach=lsp_attach }

