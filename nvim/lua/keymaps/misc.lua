local util = require('util')
local set_normal_keymap = util.set_normal_keymap

-- lua command
set_normal_keymap('<leader>;', ':lua ')

-- read/write
set_normal_keymap('<leader><cr>', util.cmd('w'))
set_normal_keymap('<leader><bs>', util.cmd('q'))

-- clear highlights
set_normal_keymap('<leader><tab>', util.cmd('noh'))

-- window navigation
set_normal_keymap('<C-h>', '<C-w>h')
set_normal_keymap('<C-j>', '<C-w>j')
set_normal_keymap('<C-k>', '<C-w>k')
set_normal_keymap('<C-l>', '<C-w>l')
