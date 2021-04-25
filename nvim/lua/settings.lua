-- NOTE: some buffer-only options require setting the global addition as well
-- pending https://github.com/neovim/neovim/pull/13479

vim.o.secure = true

-- colors
vim.o.background = 'dark'
vim.o.termguicolors = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- indents
vim.bo.autoindent = true
vim.o.autoindent = true
vim.bo.expandtab = true
vim.o.expandtab = true
vim.bo.tabstop = 2
vim.o.tabstop = 2
vim.bo.shiftwidth = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true

-- line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- misc
vim.o.completeopt = 'menuone,noselect'
vim.o.hidden = true
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
