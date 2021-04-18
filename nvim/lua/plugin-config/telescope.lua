require('telescope').setup{
  defaults = {
  }
}
telescope_key_prefix = [[<leader>f]]
telescope_binding_prefix = [[<Cmd>lua require('telescope.builtin').]]
telescope_binding_postfix = [[<Cr>]]
local function set_tele_keymap(key, binding)
  vim.api.nvim_set_keymap('n',
                          telescope_key_prefix .. key,
                          telescope_binding_prefix .. binding .. telescope_binding_postfix,
                          { noremap = true })
end

set_tele_keymap('f', 'find_files()')
set_tele_keymap('g', 'live_grep()')
set_tele_keymap('b', 'buffers()')
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

