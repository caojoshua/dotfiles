local util = require('util')

vim.g.gitgutter_map_keys = 0

-- git gutter. 'gh' = git hunk
util.set_normal_keymap('[g', util.cmd('GitGutterPrevHunk'))
util.set_normal_keymap(']g', util.cmd('GitGutterNextHunk'))
util.set_normal_keymap('<leader>ghq', util.cmd('GitGutterQuickFix') .. util.cmd('copen'))
util.set_normal_keymap('<leader>ghl', util.cmd('GitGutterQuickFixCurrentFile') .. util.cmd('copen'))
util.set_normal_keymap('<leader>ghp', util.cmd('GitGutterPreviewHunk'))
util.set_normal_keymap('<leader>ghs', util.cmd('GitGutterStageHunk'))
util.set_normal_keymap('<leader>ghu', util.cmd('GitGutterUndoHunk'))
