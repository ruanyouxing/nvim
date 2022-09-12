local plugin = require('core.pack').register_plugin
local conf = require 'modules.tools.config'
local mapping = require 'modules.mapping'
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
    { 'jvgrootveld/telescope-zoxide' },
  },
  config = conf.telescope,
}
plugin { 'edluffy/hologram.nvim' }
plugin {
  'ziontee113/icon-picker.nvim',
  event = 'InsertEnter',
  setup = mapping.icon_picker(),
  requires = 'stevearc/dressing.nvim',
  config = function()
    require 'icon-picker'
  end,
}
plugin {
  'ziontee113/color-picker.nvim',
  opt = true,
  event = 'InsertEnter',
  setup = mapping.color_picker(),
  config = function()
    require 'color-picker'
  end,
}
plugin { 'akinsho/toggleterm.nvim', config = conf.toggleterm }
plugin { 'Pocco81/true-zen.nvim', event = 'UIEnter', setup = mapping.zenmode(), config = conf.zenmode }

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
plugin { 'Pocco81/HighStr.nvim', setup = mapping.doc_highlight(), ft = { 'markdown', 'neorg' } }
plugin {
  'lewis6991/impatient.nvim',
  config = function()
    require('impatient').enable_profile()
  end,
}
plugin { 'edluffy/hologram.nvim' }
plugin {
  'iamcco/markdown-preview.nvim',
  run = 'cd app && yarn install',
  setup = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}
plugin { 'michaelb/sniprun', run = 'bash ./install.sh &' }
