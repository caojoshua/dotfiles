local set_normal_keymap = require('util').set_normal_keymap

-- lua command
set_normal_keymap('<leader>;', ':lua ')

-- read/write
set_normal_keymap('<leader><cr>', '<Cmd>w<cr>')
set_normal_keymap('<leader><bs>', '<Cmd>q<cr>')
