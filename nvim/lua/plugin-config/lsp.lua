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
  -- TODO: consider using Telescope LSP pickers instead
  local prefix = '\\'
  local opts = { noremap=true, silent=true }

  set_keymap('n', prefix .. 'c', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  set_keymap('n', prefix .. 'D', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  set_keymap('n', prefix .. 'd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  set_keymap('n', prefix .. 'h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  set_keymap('n', prefix .. 'i', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  set_keymap('n', prefix .. 'r', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  set_keymap('n', prefix .. 'R', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

  set_keymap('n', prefix .. 'e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  set_keymap('n', prefix .. '[', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  set_keymap('n', prefix .. ']', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
    }
  )

end

require('lspconfig').clangd.setup{ on_attach=lsp_attach }
require('lspconfig').tsserver.setup{ on_attach=lsp_attach }

