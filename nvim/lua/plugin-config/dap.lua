local util = require('util')

local dap, dapui = require("dap"), require("dapui")
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/josh/.local/share/nvim/mason/bin/OpenDebugAD7',
}

local gdb = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

dap.configurations.c = gdb
dap.configurations.cpp = gdb

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local prefix = '<leader>d'
local function set_keymap(key, map)
  util.set_normal_keymap(prefix .. key, util.lua_cmd(map))
end

set_keymap('b', 'require("dap").toggle_breakpoint()')
set_keymap('c', 'require("dap").continue()')
set_keymap('i', 'require("dap").step_into()')
set_keymap('o', 'require("dap").step_out()')
set_keymap('n', 'require("dap").step_over()')
set_keymap('r', 'require("dap").run_last()')
set_keymap('t', 'require("dap").terminate()')
set_keymap('d', 'require("dap").run_to_cursor()')
