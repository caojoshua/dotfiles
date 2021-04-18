-- source original .vimrc
local o = vim.o
-- TODO: setting runtimepath in lua is not expanding the `~`, using vimscript for now
-- o.runtimepath = '~/.vim,' .. o.runtimepath
-- o.runtimepath = o.runtimepath .. ',~/.vim/after'
vim.cmd('set runtimepath^=~/.vim runtimepath+=~/.vim/after')
o.packpath = o.runtimepath
vim.cmd('source ~/.vimrc')

vim.g.mapleader = ' '

require('keymaps')
require('plugin-config')

