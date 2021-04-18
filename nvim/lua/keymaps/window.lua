local set_normal_keymap = require('util').set_normal_keymap

-- navigation
set_normal_keymap('<C-h>', '<C-w>h')
set_normal_keymap('<C-j>', '<C-w>j')
set_normal_keymap('<C-k>', '<C-w>k')
set_normal_keymap('<C-l>', '<C-w>l')

local function set_keymap(key, map)
  set_normal_keymap('<leader>w' .. key, map)
end

-- splits
set_keymap('h', '<cmd>split<cr>')
set_keymap('v', '<cmd>vsplit<cr>')
--
-- open in new tab
set_keymap('t', '<C-w>T')

-- maximizing window
set_keymap('_', '<C-W>_')
set_keymap('|', '<C-W>|')

-- resizing
set_keymap('+', '<C-W>+')
set_keymap('-', '<C-W>-')
set_keymap('<', '<C-W><')
set_keymap('>', '<C-W>>')

