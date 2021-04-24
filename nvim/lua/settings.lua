vim.o.secure = true

-- colors
vim.o.background = 'dark'
vim.o.termguicolors = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- indents
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.o.smarttab = true

-- line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- misc
vim.o.completeopt = 'menuone,noselect'
vim.o.hidden = false
vim.o.secure = true

-- statusline
local statusline_components = {
  '',
  '%f',
  '%=',
  '%m',
  [[ %l:%c]],
}
for _, val in ipairs(statusline_components) do
  vim.o.statusline = vim.o.statusline .. val
end
