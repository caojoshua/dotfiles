local util = require('util')

vim.g.dap_executable = vim.fn.getcwd() .. '/'
vim.g.dap_args = {}
vim.g.get_dap_executable = function()
  return vim.g.dap_executable
end
vim.g.setup_dap_and_run = function()
  vim.g.dap_executable = vim.fn.input('Path to executable: ', vim.g.dap_executable, 'file')
  require('dap').continue()
end

local dap, dapui = require("dap"), require("dapui")
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
}

local gdb = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.g.get_dap_executable()
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
      return vim.g.get_dap_executable()
    end,
    stopAtEntry = true,
  },
}

dap.configurations.c = gdb
dap.configurations.cpp = gdb
dap.configurations.go = gdb

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
vim.keymap.set("n", '<leader>dB', function() require("dap").set_breakpoint(vim.fn.input("[DAP] condition: ")) end)
set_keymap('c', 'require("dap").continue()')
set_keymap('i', 'require("dap").step_into()')
set_keymap('o', 'require("dap").step_out()')
set_keymap('n', 'require("dap").step_over()')
set_keymap('r', 'vim.g.setup_dap_and_run()')
set_keymap('R', 'require("dap").run_last()')
-- Set callback here. The listeners above only work when the program ends on its own.
set_keymap('t', 'require("dap").terminate({}, {}, function() require(\'dapui\').close() end)')
set_keymap('u', 'require("dap").run_to_cursor()')
set_keymap('p', 'require("dap").pause()')
set_keymap('j', 'require("dap").down()')
set_keymap('k', 'require("dap").up()')
set_keymap('0', 'require("dapui").open({ reset = true })')
set_keymap('1', 'require("dapui").toggle()')
