---@diagnostic disable: different-requires
local plugin = require('core.pack').package
local conf = require 'modules.ui.config'
plugin {
  'Shatur/neovim-ayu',
  config = function()
    require('ayu').setup {
      mirage = true,
    }
  end,
  lazy = false,
  priority = 10000,
}
plugin { 'rebelot/kanagawa.nvim', config = conf.kanagawa, lazy = false, priority = 10000 }
plugin { 'tzachar/local-highlight.nvim', config = conf.highlight, event = 'BufRead' }
plugin {
  'jcdickinson/wpm.nvim',
  config = function()
    require('wpm').setup { sample_interval = 1000 }
  end,
  event = 'BufEnter',
}
plugin { 'SmiteshP/nvim-navic', lazy = true }
plugin { 'utilyre/barbecue.nvim', config = conf.winbar, dependencies = 'nvim-navic', event = 'BufRead' }
plugin {
  'nvimdev/dashboard-nvim',
  config = function()
    require 'modules.ui.dashboard'
  end,
}
plugin {
  'typicode/bg.nvim',
}
plugin { 'stevearc/dressing.nvim', config = conf.dressing }
plugin { 'catppuccin/nvim', name = 'catppuccin', config = conf.catppuccin }
plugin { 'gorbit99/codewindow.nvim', config = conf.minimap, lazy = true }
plugin { 'lukas-reineke/indent-blankline.nvim', config = conf.blankline, event = 'UIEnter' }
plugin {
  'noib3/nvim-cokeline',
  event = 'UIEnter',
  config = conf.cokeline,
}
plugin { 'yamatsum/nvim-cursorline', config = conf.cursorline }
plugin { 'kevinhwang91/nvim-hlslens', config = conf.hlslens, event = { 'CmdlineEnter', 'CmdWinEnter' } }
plugin {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = conf.fold,
  lazy = true,
}
plugin { 'j-hui/fidget.nvim', config = conf.fidget, lazy = true }
plugin { 'SmiteshP/nvim-navic', event = 'BufReadPre', config = conf.navic, module = true }
plugin { 'rcarriga/nvim-notify', config = conf.notify }
plugin { 'antoinemadec/FixCursorHold.nvim', module = true, lazy = true }
plugin {
  'kosayoda/nvim-lightbulb',
  dependencies = 'nvim-lspconfig',
  config = conf.lightbulb,
  event = 'BufEnter',
}
plugin { 'onsails/lspkind.nvim', lazy = true }
plugin {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', module = 'nui' },
  config = conf.noice,
}
plugin {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      dark_variant = 'moon',
    }
  end,
}
plugin { 'simrat39/symbols-outline.nvim', config = conf.outline, cmd = 'SymbolsOutline' }
plugin { 'edluffy/specs.nvim', event = 'UIEnter', config = conf.specs }
plugin { 'windwp/windline.nvim', config = require('modules.ui.windline').setup, event = 'BufWinEnter' }
plugin { 'mvllow/modes.nvim', event = 'UIEnter', config = conf.modes }
plugin {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()
  end,
  cmd = 'NvimTreeToggle',
}
plugin { 'folke/tokyonight.nvim', config = conf.tokyonight }
plugin { 'folke/twilight.nvim', event = 'CursorMoved', config = conf.twilight }
plugin {
  'sontungexpt/url-open',
  event = 'VeryLazy',
  cmd = 'URLOpenUnderCursor',
  config = function()
    local status_ok, url_open = pcall(require, 'url-open')
    if not status_ok then
      return
    end
    url_open.setup {}
  end,
}
plugin {
  'lukas-reineke/virt-column.nvim',
  event = 'UIEnter',
  config = function()
    require('virt-column').setup()
  end,
}
plugin {
  'gelguy/wilder.nvim',
  event = 'CmdlineEnter',
  lazy = true,
  dependencies = {
    'romgrk/fzy-lua-native',
  },
  config = conf.wilder,
}
plugin { 'mrjones2014/smart-splits.nvim', config = conf.splits, build = './kitty/install-kittens.bash' }
plugin {
  'fgheng/winbar.nvim',
  config = conf.winbar,
  event = 'UIEnter',
}
plugin { 'tamton-aquib/keys.nvim', config = conf.keystrokes, event = 'UIEnter' }
plugin { 'luukvbaal/statuscol.nvim', config = conf.statuscol, event = 'BufWinEnter' }
plugin { 'Pheon-Dev/pigeon', config = conf.pigeon, lazy = true }
