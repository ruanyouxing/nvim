local notification = { {
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
, {
  'folke/noice.nvim',
  opts = {

    cmdline = { view = 'cmdline' },
    presets = { inc_rename = true },
    lsp = { signature = { enabled = false } },
  }
} }
return notification
