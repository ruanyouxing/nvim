return {
  'mfussenegger/nvim-dap',
  lazy = true,
  opts = function()
    return {
      signs = {
        DapBreakpoint = { text = '🟥', texthl = '', linehl = '', numhl = '' },
        DapStopped    = { text = '🔴', texthl = '', linehl = '', numhl = '' },
      },
      adapters = {
        cppdbg = {
          id = 'cppdbg',
          type = 'executable',
          command = 'OpenDebugAD7',
        },
        node2 = {
          type = 'executable',
          command = 'node-debug2-adapter',
        },
        chrome = {
          type = 'executable',
          command = 'chrome-debug-adapter',
        },
      },
      configurations = {
        cpp = {
          {
            name = 'Launch file',
            type = 'cppdbg',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
          },
          {
            name = 'Attach to gdbserver :1234',
            type = 'cppdbg',
            request = 'launch',
            MIMode = 'gdb',
            miDebuggerServerAddress = 'localhost:1234',
            miDebuggerPath = '/usr/bin/gdb',
            cwd = '${workspaceFolder}',
            setupCommands = {
              {
                text = '-enable-pretty-printing',
                description = 'enable pretty printing',
                ignoreFailures = false,
              },
            },
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
          },
        },
        javascript = {
          {
            name = 'Launch',
            type = 'node2',
            request = 'launch',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
          },
          {
            name = 'Attach to process',
            type = 'node2',
            request = 'attach',
            processId = require('dap.utils').pick_process,
          },
        },
        javascriptreact = {
          {
            type = 'chrome',
            request = 'attach',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            port = 9222,
            webRoot = '${workspaceFolder}',
          },
        },
      },
    }
  end,

  config = function(_, opts)
    local dap = require('dap')
    for name, sign in pairs(opts.signs) do
      vim.fn.sign_define(name, sign)
    end
    for name, adapter in pairs(opts.adapters) do
      dap.adapters[name] = adapter
    end
    for lang, config in pairs(opts.configurations) do
      dap.configurations[lang] = config
    end
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
    dap.configurations.typescript = dap.configurations.javascript
    dap.configurations.typescriptreact = dap.configurations.javascriptreact
  end,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    lazy = true,
    opts = {},
  },
}
