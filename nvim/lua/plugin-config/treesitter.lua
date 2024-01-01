local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- disable treesitter for large files
local disable = function(_, bufnr)
  return vim.api.nvim_buf_line_count(bufnr) > 8000
end

local highlight = {
  enable = true,
  disable = disable,
}

local textobjects = {
  select = {
    enable = true,
    disable = disable,
    keymaps = {
      ["<leader>ac"] = "@class.outer",
      ["<leader>ic"] = "@class.inner",
      ["<leader>ai"] = "@conditional.outer",
      ["<leader>ii"] = "@conditional.inner",
      ["<leader>af"] = "@function.outer",
      ["<leader>if"] = "@function.inner",
      ["<leader>al"] = "@loop.outer",
      ["<leader>il"] = "@loop.inner",
    },
  },
  move = {
    enable = true,
    goto_next_start = {
      ["<leader>]c"] = "@class.outer",
      ["<leader>]i"] = "@conditional.outer",
      ["<leader>]l"] = "@loop.outer",
      ["<leader>]f"] = "@function.outer",
    },
    goto_next_end = {
      ["<leader>]C"] = "@class.outer",
      ["<leader>]I"] = "@conditional.outer",
      ["<leader>]L"] = "@loop.outer",
      ["<leader>]F"] = "@function.outer",
    },
    goto_previous_start = {
      ["<leader>[c"] = "@class.outer",
      ["<leader>[i"] = "@conditional.outer",
      ["<leader>[l"] = "@loop.outer",
      ["<leader>[f"] = "@function.outer",
    },
    goto_previous_end = {
      ["<leader>[C"] = "@class.outer",
      ["<leader>[I"] = "@conditional.outer",
      ["<leader>[L"] = "@loop.outer",
      ["<leader>[F"] = "@function.outer",
    },
  },
}

vim.keymap.set("n", ";", ts_repeat_move.repeat_last_move)
vim.keymap.set("n", ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set("n", "f", ts_repeat_move.builtin_f)
vim.keymap.set("n", "F", ts_repeat_move.builtin_F)
vim.keymap.set("n", "t", ts_repeat_move.builtin_t)
vim.keymap.set("n", "T", ts_repeat_move.builtin_T)

local incremental_selection = {
  enable = true,
  disable = disable,
  keymaps = {
    init_selection = "<F4>",
    node_incremental = "<C-n>",
    scope_incremental = "<C-m>",
    node_decremental = "<C-p>",
  },
}

local rainbow = {
  enable = true,
  disable = disable,
  extended_mode = true,
}

require('nvim-treesitter.configs').setup {
  highlight = highlight,
  incremental_selection = incremental_selection,
  textobjects = textobjects,
  rainbow = rainbow,
}
