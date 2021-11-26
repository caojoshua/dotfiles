local util = require('util')

-- colorscheme
require('base16-colorscheme').setup('dracula')

-- indents
vim.g.indentLine_char = '│'

-- file manager
util.set_normal_keymap('<F2>', '<cmd>Lf<cr>')
vim.g.lf_map_keys = 0
vim.g.lf_width = 0.9
vim.g.lf_height = 0.9
vim.g.floaterm_opener = 'edit'

-- hop
require('hop').setup()
util.set_normal_keymap('<leader>hw', util.lua_cmd([[require('hop').hint_words()]]))
util.set_normal_keymap('<leader>hf', util.lua_cmd([[require('hop').hint_char1()]]))
util.set_keymap('o', '<leader>w', util.lua_cmd([[require('hop').hint_words()]]))
util.set_keymap('o', '<leader>f', util.lua_cmd([[require('hop').hint_char1()]]))
util.set_keymap('o', '<leader>t', util.lua_cmd([[require('hop').hint_char1({ inclusive_jump = false })]]))

-- whitespace
util.set_normal_keymap('<F10>', [[<cmd>StripWhitespace<cr>]])
