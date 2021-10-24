local set_normal_keymap = require('util').set_normal_keymap

-- lua command
set_normal_keymap('<leader>;', ':lua ')

-- read/write
set_normal_keymap('<leader><cr>', '<Cmd>w<cr>')
set_normal_keymap('<leader><bs>', '<Cmd>q<cr>')

-- window navigation
set_normal_keymap('<C-h>', '<C-w>h')
set_normal_keymap('<C-j>', '<C-w>j')
set_normal_keymap('<C-k>', '<C-w>k')
set_normal_keymap('<C-l>', '<C-w>l')
