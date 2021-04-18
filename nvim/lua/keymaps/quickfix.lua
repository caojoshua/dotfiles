local set_normal_keymap = require('util').set_normal_keymap

local function set_quickfix_keymap(key, map)
  set_normal_keymap('<leader>q' .. key, map)
end
local function set_location_list_keymap(key, map)
  set_normal_keymap('<leader>l' .. key, map)
end

-- open/close window
set_quickfix_keymap('o', '<cmd>copen<cr>')
set_quickfix_keymap('c', '<cmd>cclose<cr>')
set_location_list_keymap('o', '<cmd>lopen<cr>')
set_location_list_keymap('c', '<cmd>lclose<cr>')

-- navigation
set_normal_keymap('[q', '<cmd>cprev<cr>')
set_normal_keymap(']q', '<cmd>cnext<cr>')
set_normal_keymap('[l', '<cmd>lprev<cr>')
set_normal_keymap(']l', '<cmd>lnext<cr>')
