local plugin = require('core.pack').package
local conf = require 'modules.tools.config'
plugin { 'PHSix/faster.nvim', event = 'VimEnter' }
plugin { 'anuvyklack/fold-preview.nvim', event = 'BufEnter', config = conf.fold_preview }
plugin { 'is0n/fm-nvim', config = conf.fm, cmd = 'Ranger' }
plugin { 'Jxstxs/keystack.nvim', config = conf.keystack }
plugin {
  'anuvyklack/hydra.nvim',
  lazy = true,
  event = 'BufRead',
  dependencies = 'anuvyklack/keymap-layer.nvim',
  config = conf.hydra,
}
plugin {
  'williamboman/mason.nvim',
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      cmd = 'Mason',
      config = conf.mason_tools,
    },
  },
  event = 'BufRead',
  config = conf.mason,
}
plugin { 'gbprod/stay-in-place.nvim', config = conf.stay_in_place }
plugin {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'sharkdp/fd',                                lazy = true },
    { 'BurntSushi/ripgrep',                        lazy = true },
    { 'nvim-telescope/telescope-media-files.nvim', lazy = true },
    { 'jvgrootveld/telescope-zoxide',              lazy = true },
    { 'nvim-lua/popup.nvim',                       lazy = true },
    { 'nvim-lua/plenary.nvim',                     lazy = true },
  },
  config = conf.telescope,
  lazy = true,
}
plugin {
  'ziontee113/icon-picker.nvim',
  event = 'InsertEnter',
  dependencies = 'dressing.nvim',
  config = function()
    require 'icon-picker'
  end,
  cmd = 'IconPickerInsert',
}
plugin {
  'ziontee113/color-picker.nvim',
  lazy = true,
  event = 'InsertEnter',
  config = function()
    require 'color-picker'
  end,
  cmd = 'PickColorInsert',
}
plugin { 'akinsho/toggleterm.nvim', config = conf.toggleterm, cmd = 'ToggleTerm' }
plugin { 'Pocco81/true-zen.nvim', event = 'UIEnter', config = conf.zenmode, cmd = 'TZAtaraxis' }

plugin { 'mbbill/undotree', event = 'TextChanged' }
plugin { 'nvim-treesitter/playground', dependencies = 'nvim-treesitter', cmd = 'TSPlaygroundToggle' }
plugin { 'dstein64/vim-startuptime', cmd = 'StartupTime' }
plugin { 'gbprod/yanky.nvim', config = conf.yank }
plugin { 'nyngwang/NeoZoom.lua', cmd = 'NeoZoomToggle', config = conf.zoom }
