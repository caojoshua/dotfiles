local M = {}

M.set_normal_keymap = function(key, map)
  vim.api.nvim_set_keymap('n', key, map, { noremap = true })
end

return M
