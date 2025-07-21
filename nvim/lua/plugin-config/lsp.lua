local util = require('util')

local prefix = '<leader>l'
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

local lsp_servers = { "clangd", "gopls", "pyright", "rust_analyzer", "lua_ls", "tsserver", "zls" }
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_servers
})
require("neodev").setup()

require('lspconfig.configs')['tblgen-lsp-server'] = {
  default_config = {
    cmd = { '/home/josh/src/mlir/llvm-project/build/bin/tblgen-lsp-server' },
    filetypes = {'td'},
    root_dir = require('lspconfig').util.root_pattern(".git"),
    autostart = true,
    on_attach=lsp_attach,
  };
}
local custom_servers = { 'tblgen-lsp-server' }

-- FIXME: figure out all the MLIR LSP stuff
for _, lsp_server in pairs(lsp_servers) do
  if lsp_server == "clangd" then
    require('lspconfig')[lsp_server].setup {
      on_attach = lsp_attach,
      filetypes = { 'cpp', 'h', 'inc' }
    }
  else
    require('lspconfig')[lsp_server].setup {
      on_attach = lsp_attach
    }
  end
end
for _, lsp_server in pairs(custom_servers) do
  require('lspconfig')[lsp_server].setup {
    on_attach=lsp_attach
  }
end

-- additional filetypes
vim.filetype.add({
 extension = {
  td = "td",
 },
})
vim.filetype.add({
 extension = {
  inc = "inc",
 },
})
