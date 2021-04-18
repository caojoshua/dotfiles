local M = {}

M.set_normal_keymap = function(key, map)
  vim.api.nvim_set_keymap('n', key, map, { noremap = true })
end

M.lua_cmd = function(cmd)
  return "<cmd>lua " .. cmd .. "<cr>"
end

return M
