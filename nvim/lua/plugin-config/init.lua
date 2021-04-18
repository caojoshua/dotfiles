local function plugin_require(module)
  require('plugin-config/' .. module)
end

plugin_require('completion')
plugin_require('file-explorer')
plugin_require('lsp')
plugin_require('telescope')
plugin_require('treesitter')
plugin_require('misc')
