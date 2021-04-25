vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>NvimTreeToggle<Cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tf', '<Cmd>NvimTreeFindFile<Cr>', { noremap = true })

-- TODO: follow, add_trailing, group_empty are not working
local g = vim.g
g.nvim_tree_show_icons = {}
g.nvim_tree_follow = true
g.nvim_tree_add_trailing = true
g.nvim_tree_group_empty = true
g.nvim_tree_ignore = {
  [[.git]],
  [[tags]],
  [[cscope.*]], -- globs not supported yet
  [[LICENSE]],
}
g.nvim_tree_special_files = {
  ["README.md"] = true,
  ["readme.md"] = true,
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["<C-]>"]          = tree_cb("cd"),
  ["|"]              = tree_cb("vsplit"),
  ["-"]              = tree_cb("split"),
  ["<C-t>"]          = tree_cb("tabnew"),
  ["K"]              = tree_cb("prev_sibling"),
  ["J"]              = tree_cb("next_sibling"),
  ["H"]              = tree_cb("parent_node"),
  ["P"]              = tree_cb("parent_node"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<Tab>"]          = tree_cb("preview"),
  ["<C-I>"]          = tree_cb("toggle_ignored"),
  ["<C-D>"]          = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["x"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["d"]              = tree_cb("cut"),
  ["y"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[g"]             = tree_cb("prev_git_item"),
  ["]g"]             = tree_cb("next_git_item"),
  ["s"]              = "<Cmd>NvimTreeClipboard<CR>",
  ["q"]              = tree_cb("close"),
}
