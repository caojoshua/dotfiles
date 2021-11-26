local util = require('util')

vim.g.gitgutter_map_keys = 0

-- tig
util.set_normal_keymap('<leader>gg', util.cmd('Tig'))
util.set_normal_keymap('<leader>gs', util.cmd('Tig status'))
util.set_normal_keymap('<leader>gl', util.cmd('Tig log'))
util.set_normal_keymap('<leader>gr', util.cmd('Tig refs'))

-- git gutter. 'gh' = git hunk
util.set_normal_keymap('[g', util.cmd('GitGutterPrevHunk'))
util.set_normal_keymap(']g', util.cmd('GitGutterNextHunk'))
util.set_normal_keymap('<leader>ghq', util.cmd('GitGutterQuickFix') .. util.cmd('copen'))
util.set_normal_keymap('<leader>ghl', util.cmd('GitGutterQuickFixCurrentFile') .. util.cmd('copen'))
util.set_normal_keymap('<leader>ghp', util.cmd('GitGutterPreviewHunk'))
util.set_normal_keymap('<leader>ghs', util.cmd('GitGutterStageHunk'))
util.set_normal_keymap('<leader>ghu', util.cmd('GitGutterUndoHunk'))
