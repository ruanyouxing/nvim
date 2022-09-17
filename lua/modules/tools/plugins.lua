local plugin = require('core.pack').register_plugin
local conf = require 'modules.tools.config'
plugin { 'PHSix/faster.nvim', event = 'VimEnter', config = conf.accelerated_jk }
plugin {
  'lewis6991/impatient.nvim',
  config = function()
    require('impatient').enable_profile()
  end,
}
plugin { 'is0n/fm-nvim', config = conf.fm }
plugin { 'anuvyklack/fold-preview.nvim', after = 'nvim-ufo', config = conf.fold_preview }
plugin { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'org', 'norg' }, config = conf.headlines }
plugin { 'Jxstxs/keystack.nvim', config = conf.keystack }
plugin {
  'anuvyklack/hydra.nvim',
  opt = true,
  event = 'BufRead',
  requires = 'anuvyklack/keymap-layer.nvim',
  config = conf.hydra,
}
plugin {
  'williamboman/mason.nvim',
  requires = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      config = conf.mason_tools,
      after = 'mason.nvim',
    },
  },
  event = 'BufRead',
  config = conf.mason,
}
plugin { 'gbprod/stay-in-place.nvim', config = conf.stay_in_place }
plugin {
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'sharkdp/fd' },
    { 'BurntSushi/ripgrep' },
    { 'jvgrootveld/telescope-zoxide', opt = true },
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
  },
  config = conf.telescope,
}
plugin { 'edluffy/hologram.nvim' }
plugin {
  'ziontee113/icon-picker.nvim',
  event = 'InsertEnter',
  requires = 'stevearc/dressing.nvim',
  config = function()
    require 'icon-picker'
  end,
}
plugin {
  'ziontee113/color-picker.nvim',
  opt = true,
  event = 'InsertEnter',
  config = function()
    require 'color-picker'
  end,
}
plugin { 'akinsho/toggleterm.nvim', config = conf.toggleterm }
plugin { 'Pocco81/true-zen.nvim', event = 'UIEnter', config = conf.zenmode }

plugin {
  'iamcco/markdown-preview.nvim',
  run = 'cd app && yarn install',
  setup = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}
plugin { 'mbbill/undotree', event = 'TextChanged' }
plugin { 'dstein64/vim-startuptime' }
plugin { 'Pocco81/HighStr.nvim', ft = { 'markdown', 'neorg' } }
