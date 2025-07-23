local util = require('util')

local prefix = '<leader>l'
local opts = { noremap=true, silent=true }

local lsp_attach = function(args)
  -- local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
  local buf = args.buf
  require('lsp_signature').on_attach()

  -- mappings
  -- TODO: consider using Telescope LSP pickers instead
  local function set_keymap(key, map)
    vim.api.nvim_buf_set_keymap(buf, 'n', prefix .. key, util.lua_cmd(map), opts)
  end

  set_keymap('c', 'vim.lsp.buf.code_action()')
  set_keymap('D', 'vim.lsp.buf.declaration()')
  set_keymap('d', 'vim.lsp.buf.definition()')
  set_keymap('f', 'vim.lsp.buf.format()')
  set_keymap('h', 'vim.lsp.buf.hover()')
  set_keymap('i', 'vim.lsp.buf.implementation()')
  set_keymap('r', 'vim.lsp.buf.references({ includeDeclaration = false })')
  set_keymap('R', 'vim.lsp.buf.rename()')

  set_keymap('e', 'vim.diagnostic.open_float()')
  set_keymap('E', 'vim.diagnostic.setloclist()')

  -- diagnostics settings
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = {
        priority = 1000
      }
    }
  )

  --- aerial
  require('aerial').setup({
    layout = {
      win_opts = {
        number = true,
        relativenumber = true,
      },
    },
  })
  util.set_normal_keymap('<F3>', '<cmd>AerialToggle<cr>')
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = lsp_attach,
})

local lsp_servers = { "clangd", "gopls", "pyright", "rust_analyzer", "lua_ls", "ts_ls", "zls" }
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_servers
})
