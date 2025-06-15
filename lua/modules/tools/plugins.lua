local plugin = require('core.pack').package
local plug = require('core.keymap').plug
local conf = require 'modules.tools.config'
plugin { 'PHSix/faster.nvim', event = 'VimEnter' }
plugin { 'is0n/fm-nvim', config = conf.fm, cmd = 'Ranger' }
plugin {
  'phaazon/hop.nvim',
  branch = 'v2',
  event = 'BufEnter',
  config = conf.hop,
}
plugin { 'Jxstxs/keystack.nvim', config = conf.keystack, lazy = true }
plugin {
  'anuvyklack/hydra.nvim',
  dependencies = 'anuvyklack/keymap-layer.nvim',
  config = conf.hydra,
  keys = '<leader>l',
}
plugin { 'SmiteshP/nvim-navbuddy', config = conf.navbuddy }
plugin { 'stevearc/overseer.nvim', config = conf.overseer, cmd = 'OverseerRun' }
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
  cmd = 'Telescope',
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
plugin { 'nvim-pack/nvim-spectre', config = conf.spectre, lazy = true }
plugin { 'akinsho/toggleterm.nvim', config = conf.toggleterm, cmd = 'ToggleTerm' }
plugin { 'Pocco81/true-zen.nvim', event = 'UIEnter', config = conf.zenmode, cmd = 'TZAtaraxis' }

plugin { 'mbbill/undotree', event = 'TextChanged' }
plugin { 'nvim-treesitter/playground', dependencies = 'nvim-treesitter', cmd = 'TSPlaygroundToggle' }
plugin { 'dstein64/vim-startuptime', cmd = 'StartupTime' }
plugin {
  'gbprod/yanky.nvim',
  config = conf.yank,
  keys = {
    { 'p',  plug 'YankyPutAfter',   mode = { 'n', 'x' } },
    { 'P',  plug 'YankyPutBefore',  mode = { 'n', 'x' } },
    { 'gp', plug 'YankyGPutAfter',  mode = { 'n', 'x' } },
    { 'gP', plug 'YankyGPutBefore', mode = { 'n', 'x' } },
    { 'y',  plug 'YankyYank',       mode = { 'n', 'x' } },
    {
      '<C-S-y>',
      function()
        require('telescope').extensions.yank_history.yank_history()
      end,
    },
  },
}
plugin { 'axkirillov/hbac.nvim', config = conf.autoclose, event = 'BufRead' }
plugin {
  'xeluxee/competitest.nvim',
  config = conf.cptest,
  lazy = true,
  cmd = { 'CompetiTestRun', 'CompetiTestAdd', 'CompetiTestDelete', 'CompetiTestEdit' },
}
