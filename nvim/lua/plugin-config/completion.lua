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
