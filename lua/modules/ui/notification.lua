plugin = require('core.pack').package

plugin {
  'rcarriga/nvim-notify',
  config = function()
    vim.notify = require 'notify'
    require('notify').setup {
      stages = 'slide',
      render = 'default',
      timeout = 300,
      background_colour = '#ffffff',
      minimum_width = 50,
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
    }
  end,
}
plugin {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', module = 'nui' },
  config = function()
    require('noice').setup {
      cmdline = { view = 'cmdline' },
      presets = { inc_rename = true },
      lsp = { signature = { enabled = false } },
    }
  end,
}
