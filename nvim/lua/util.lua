local M = {}

M.set_keymap = function(mode, key, map)
  vim.api.nvim_set_keymap(mode, key, map, { noremap = true })
end

M.set_normal_keymap = function(key, map)
  M.set_keymap('n', key, map)
end

M.set_normal_buf_keymap = function(buf, key, map)
  vim.api.nvim_buf_set_keymap(buf, 'n', key, map, { noremap = true })
end

M.cmd = function(cmd)
  return '<cmd>' .. cmd .. '<cr>'
end

M.lua_cmd = function(cmd)
  return M.cmd('lua ' .. cmd)
end

return M
