local plugin = require('core.pack').register_plugin
local conf = require 'modules.debugging.config'
local ui = require 'modules.ui.config'

plugin {
  'mfussenegger/nvim-dap',
  opt = true,
  event = 'BufRead',
  config = conf.dap,
  requires = {
    'rcarriga/nvim-dap-ui',
    after = 'nvim-dap',
    config = ui.dap,
  },
}
