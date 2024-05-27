require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').cycle_history_next,
        ["<C-k>"] = require('telescope.actions').cycle_history_prev,
        ["<C-d>"] = require('telescope.actions').delete_buffer,
      },
      n = {
        ["<C-j>"] = require('telescope.actions').cycle_history_next,
        ["<C-k>"] = require('telescope.actions').cycle_history_prev,
        ["<C-d>"] = require('telescope.actions').delete_buffer,
      },
    },
    wrap_results = true,
  },
}

require('telescope').load_extension('fzf')

telescope_key_prefix = [[<leader>f]]
telescope_binding_prefix = [[<Cmd>lua require('telescope.builtin').]]
local function set_tele_keymap(key, binding)
  vim.api.nvim_set_keymap('n',
                          telescope_key_prefix .. key,
                          telescope_binding_prefix.. binding .. '<cr>',
                          { noremap = true })
end

set_tele_keymap('f', 'find_files({hidden = true})')
set_tele_keymap('F', 'git_files({hidden = true})')
set_tele_keymap('g', 'live_grep()')
set_tele_keymap('b', 'buffers{ ignore_current_buffer = true, sort_mru = true }')
set_tele_keymap('\'', 'marks()')
set_tele_keymap('"', 'registers()')
set_tele_keymap('/', 'search_history()')
set_tele_keymap('q', 'quickfix()')
set_tele_keymap('l', 'loclist()')
set_tele_keymap('j', 'jumplist()')
set_tele_keymap(':', 'command_history()')
set_tele_keymap('o', 'vim_options()')
set_tele_keymap('k', 'keymaps()')
set_tele_keymap('m', [[man_pages({sections = {'ALL'}})]])
set_tele_keymap('h', 'help_tags()')
set_tele_keymap('c', 'commands()')

