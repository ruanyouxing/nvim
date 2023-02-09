---@diagnostic disable: different-requires
local plugin = require('core.pack').package
local conf = require 'modules.ui.config'
plugin {
  'Shatur/neovim-ayu',
  config = function()
    require('ayu').setup {
      mirage = true,
    }
    vim.cmd('colorscheme ayu-mirage')
  end,
}
plugin {'utilyre/barbecue.nvim', config = conf.winbar, dependencies = 'SmiteshP/nvim-navic'}
plugin {
  'glepnir/dashboard-nvim',
  config = function()
    require 'modules.ui.dashboard'
  end,
}
plugin { 'catppuccin/nvim', name = 'catppuccin', config = conf.catppuccin, lazy = true }
plugin { 'gorbit99/codewindow.nvim', config = conf.minimap, event = 'BufRead' }
plugin { 'lukas-reineke/indent-blankline.nvim', config = conf.blankline, event = 'UIEnter' }
plugin {
  'noib3/nvim-cokeline',
  event = 'UIEnter',
  config = conf.cokeline,
}
plugin { 'yamatsum/nvim-cursorline', config = conf.cursorline }
plugin {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = conf.fold,
  event = 'UIEnter',
}
plugin { 'j-hui/fidget.nvim', config = conf.fidget }
plugin { 'SmiteshP/nvim-navic', event = 'BufReadPre', config = conf.navic, module = true }
plugin { 'rcarriga/nvim-notify', config = conf.notify }
plugin {
  'kosayoda/nvim-lightbulb',
  dependencies = 'antoinemadec/FixCursorHold.nvim',
  config = conf.lightbulb,
}
plugin {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', module = 'nui' },
  config = function()
    require('noice').setup {
      cmdline = { view = 'cmdline' },
      lsp = { signature = { enabled = false } },
    }
  end,
}
plugin { 'edluffy/specs.nvim', event = 'UIEnter', config = conf.specs }
plugin { 'glepnir/galaxyline.nvim', event = 'BufWinEnter', config = require('modules.ui.galaxyline').setup }
plugin { 'mvllow/modes.nvim', event = 'UIEnter', config = conf.modes }
plugin {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()
  end,
}
plugin { 'folke/tokyonight.nvim', config = conf.tokyonight }
plugin { 'folke/twilight.nvim', event = 'CursorMoved', config = conf.twilight }
plugin {
  'lukas-reineke/virt-column.nvim',
  event = 'UIEnter',
  config = function()
    require('virt-column').setup()
  end,
}
plugin {
  'gelguy/wilder.nvim',
  event = { 'CmdwinEnter', 'CmdlineEnter' },
  dependencies = {
    { 'roxma/nvim-yarp', build = ':UpdateRemotePlugins' },
    'roxma/vim-hug-neovim-rpc',
    'romgrk/fzy-lua-native',
  },
  config = conf.wilder,
}
plugin {
  'fgheng/winbar.nvim',
  config = conf.winbar,
  event = 'UIEnter'
}
