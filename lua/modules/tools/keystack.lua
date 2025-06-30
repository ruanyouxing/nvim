plugin {
  'Jxstxs/keystack.nvim',
  config = function()
    _G.DAPStopped = true
    local keystack = require 'keystack'

    keystack.config {
      default_opts = { silent = true, noremap = true },
      default_exit_key = { 'q', '<ESC>' },
      default_mode = 'n',
      mappings = {
        exit_key = { 'q', '<ESC>' },
        ['debugging'] = {
          maps = {
            ['c'] = function()
              require('dap').run_to_cursor()
            end,
            ['<C-c>'] = function()
              require('dap').terminate()
            end,
            ['K'] = function()
              require('dap.ui.widgets').hover()
            end,
            ['<F5>'] = function()
              require('dapui').open()
            end,
            ['<C-r>'] = function()
              require('dap_setup').reload_continue()
            end,
            ['R'] = function()
              require('dap').repl.toggle()
            end,
            ['s'] = function()
              require('dap.ui.variables').scope()
            end,
            ['<Space>'] = function()
              require('dap').toggle_breakpoint()
            end,
            ['['] = function()
              require('dap').step_over()
            end,
            [']'] = function()
              require('dap').step_into()
            end,
            ['B'] = function()
              require('dap').step_out()
            end,
            ['b'] = function()
              require('dap').step_back()
            end,
            ['D'] = function()
              require('dap').clear_breakpoints()
            end,
            ['e'] = function()
              require('dapui').eval()
            end,
            ['<C-S-d>'] = function()
              if DAPStopped then
                require('dap').continue()
                print 'Starting DAP...'
                DAPStopped = false
              else
                require('dap').close()
                print 'DAP Stopped.'
                DAPStopped = true
              end
            end,
          },
        },
      },
    }
  end,
  lazy = true,
}
