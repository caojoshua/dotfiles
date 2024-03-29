local util = require('util')

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-c>'] = cmp.mapping.close(),
    ['<Cr>'] = cmp.mapping.confirm({ select = false }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

-- luasnips
-- Do I want to set these keymaps? They conflict with cmp keymaps, and I do not like setting insert mode keymaps.
-- vim.api.nvim_set_keymap('i', '<C-n>', util.lua_cmd([[require('luasnip').jump(1)]]), { noremap = true })
-- vim.api.nvim_set_keymap('i', '<C-p>', util.lua_cmd([[require('luasnip').jump(-1)]]), { noremap = true })
-- vim.api.nvim_set_keymap('s', '<C-n>', util.lua_cmd([[require('luasnip').jump(1)]]), { noremap = true })
-- vim.api.nvim_set_keymap('s', '<C-p>', util.lua_cmd([[require('luasnip').jump(-1)]]), { noremap = true })
require("luasnip/loaders/from_vscode").lazy_load()
