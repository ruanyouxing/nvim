local plugin = require('core.pack').package
local conf = require 'modules.debugging.config'
local ui = require 'modules.ui.config'

plugin {
  'mfussenegger/nvim-dap',
  lazy = true,
  config = conf.dap,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    lazy = true,
    config = ui.dap,
  },
}
