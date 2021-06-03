local util = require('util')

-- colorscheme
require('base16-colorscheme').setup('dracula')

-- indents
vim.g.indentLine_char = '│'

-- autopairs
require('nvim-autopairs').setup{}

-- file manager
util.set_normal_keymap('<F2>', '<cmd>Lf<cr>')
vim.g.lf_width = 0.9
vim.g.lf_height = 0.9
