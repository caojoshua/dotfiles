-- treesitter
local util = require('util')

-- disable treesitter for large files
disable = function(_, bufnr)
  return vim.api.nvim_buf_line_count(bufnr) > 10000
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
      ["<leader>/"] = "@comment.outer",
      ["<leader>ai"] = "@conditional.outer",
      ["<leader>ii"] = "@conditional.inner",
      ["<leader>af"] = "@function.outer",
      ["<leader>if"] = "@function.inner",
      ["<leader>al"] = "@loop.outer",
      ["<leader>il"] = "@loop.inner",
      ["<leader>ap"] = "@parameter.outer",
      ["<leader>ip"] = "@parameter.inner",
      ["<leader>s"] = "@statement.outer",
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>tc"] = "@class.outer",
      ["<leader>tf"] = "@function.outer",
      ["<leader>tp"] = "@parameter.inner",
      ["<leader>ts"] = "@statement.outer",
    },
    swap_previous = {
      ["<leader>tC"] = "@class.outer",
      ["<leader>tF"] = "@function.outer",
      ["<leader>tP"] = "@parameter.inner",
      ["<leader>tS"] = "@statement.outer",
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
