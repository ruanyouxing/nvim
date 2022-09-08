local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')
local mapping = require('modules.mapping')
local statusline = require('modules.ui.galaxyline')
plugin ({'goolord/alpha-nvim', config = conf.alpha })
plugin ({'lukas-reineke/indent-blankline.nvim',
  after = 'nvim-treesitter',
  config = conf.blankline,
})
plugin ({'noib3/nvim-cokeline',
  opt = true,
  event = 'UIEnter',
  setup = mapping.cokeline(),
  config = conf.cokeline,
})
plugin ({'yamatsum/nvim-cursorline', config = conf.cursorline })
plugin ({'kevinhwang91/nvim-ufo',
  requires = 'kevinhwang91/promise-async',
  after = { 'nvim-treesitter', 'nvim-lspconfig' },
  config = conf.fold,
})
plugin ({'j-hui/fidget.nvim',
  after = 'nvim-lsp-installer',
  config = conf.fidget,
})
plugin ({'SmiteshP/nvim-navic',
  opt = true,
  event = 'BufReadPre',
  config = conf.navic,
})
plugin ({'rcarriga/nvim-notify', config = conf.notify })
plugin ({'kosayoda/nvim-lightbulb',
  opt = true,
  requires = 'antoinemadec/FixCursorHold.nvim',
  after = 'nvim-lspconfig',
  config = conf.lightbulb,
})

plugin ({'glepnir/galaxyline.nvim',
  event = 'BufWinEnter',
  config = statusline.setup,
})
plugin ({'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()
  end,
})
plugin ({'rose-pine/neovim', as = 'rose-pine', config = conf.rose_pine })
plugin ({'folke/tokyonight.nvim', config = conf.tokyonight })
plugin ({'xiyaowong/nvim-transparent', config = conf.transparent })
plugin ({'folke/twilight.nvim', event = 'CursorMoved', config = conf.twilight })
plugin ({'xiyaowong/virtcolumn.nvim',
  config = function()
    vim.g.virtcolumn_char = '▕' -- char to display the line
    vim.g.virtcolumn_priority = 10 -- priority of extmark
  end,
})
plugin ({'gelguy/wilder.nvim',
  opt = true,
  event = { 'CmdwinEnter', 'CmdlineEnter' },
  requires = {
    { 'roxma/nvim-yarp', run = ':UpdateRemotePlugins' },
    'roxma/vim-hug-neovim-rpc',
    'romgrk/fzy-lua-native',
  },
  config = conf.wilder,
})
