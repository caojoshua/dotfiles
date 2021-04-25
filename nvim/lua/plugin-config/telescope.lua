local setup = function()
  require('telescope').setup{
    defaults = {
    }
  }
end

telescope_key_prefix = [[<leader>f]]
telescope_binding_prefix = [[<Cmd>lua require('telescope.builtin').]]
local function set_tele_keymap(key, binding)
  vim.api.nvim_set_keymap('n',
                          telescope_key_prefix .. key,
                          telescope_binding_prefix.. binding .. '<cr>',
                          { noremap = true })
end

set_tele_keymap('f', 'find_files()')
set_tele_keymap('g', 'live_grep()')
set_tele_keymap('b', 'buffers{ sort_lastused = true }')
set_tele_keymap('\'', 'marks()')
set_tele_keymap('r', 'registers()')
set_tele_keymap('q', 'quickfix()')
set_tele_keymap('e', 'command_history()')
set_tele_keymap('o', 'vim_options()')
set_tele_keymap('k', 'keymaps()')
set_tele_keymap('m', 'man_pages()')
set_tele_keymap('h', 'help_tags()')
set_tele_keymap('c', 'lsp_code_actions()')
set_tele_keymap('d', 'lsp_workspace_diagnostics()')

return { setup = setup }
