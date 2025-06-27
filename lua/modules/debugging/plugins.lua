local plugin = require('core.pack').package
local conf = require 'modules.debugging.config'

plugin {
  'mfussenegger/nvim-dap',
  lazy = true,
  config = conf.dap,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    lazy = true,
    config = function()
      require('dapui').setup {}
    end,
  },
}
