local plugins = {}
local editor = require('modules.editor')
local ui = require('modules.ui')
local galaxyline = require('modules.galaxyline')
local tools = require('modules.tools')
local completion = require('modules.completion')
local mapping = require('modules.mapping')
--  _____    _ _ _
-- | ____|__| (_) |_ ___  _ __
-- |  _| / _` | | __/ _ \| '__|  Editor
-- | |__| (_| | | || (_) | |
-- |_____\__,_|_|\__\___/|_|

plugins['windwp/nvim-autopairs'] = {
  after = 'nvim-cmp',
  config = completion.autopairs,
}
plugins['Pocco81/AutoSave.nvim'] = { config = editor.autosave }
plugins['rmagatti/auto-session'] = { config = editor.autosession }
plugins['famiu/bufdelete.nvim'] = {
  opt = true,
  event = 'BufDelete',
  config = {
    vim.keymap.set('n', '<C-w>', function()
      require('bufdelete').bufdelete(0, true)
    end),
  },
}
plugins['max397574/better-escape.nvim'] = {
  event = 'InsertEnter',
  config = editor.better_escape,
}
plugins['norcalli/nvim-colorizer.lua'] = {
  config = function()
    require('colorizer').setup({})
  end,
}
plugins['sindrets/diffview.nvim'] = { opt = true, config = editor.diffview }
plugins['lewis6991/gitsigns.nvim'] = { opt = true, config = editor.gitsigns }
plugins['nvim-lua/plenary.nvim'] = { opt = true }
plugins['terrortylor/nvim-comment'] = { config = editor.comment }
plugins['kyazdani42/nvim-web-devicons'] = {}
plugins['edluffy/specs.nvim'] = { config = editor.specs }
plugins['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  run = ':TSUpdate',
  config = editor.treesitter,
}
plugins['nvim-treesitter/nvim-treesitter-refactor'] = {
  after = 'nvim-treesitter',
}
plugins['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter',
}
plugins['windwp/nvim-ts-autotag'] = { after = 'nvim-treesitter' }
plugins['p00f/nvim-ts-rainbow'] = { after = 'nvim-treesitter' }
plugins['andymass/vim-matchup'] = { after = 'nvim-treesitter' }
plugins['romgrk/nvim-treesitter-context'] = {
  after = 'nvim-treesitter',
  config = editor.ts_context,
}
plugins['simrat39/symbols-outline.nvim'] = {
  after = 'nvim-lspconfig',
  config = editor.symbols_outline,
}
plugins['abecodes/tabout.nvim'] = {
  after = 'nvim-treesitter',
  config = editor.tabout,
}
plugins['lewis6991/impatient.nvim'] = {
  config = function()
    require('impatient').enable_profile()
  end,
}
--  _____           _
-- |_   _|__   ___ | |___
--   | |/ _ \ / _ \| / __              Tools
--   | | (_) | (_) | \__ \
--   |_|\___/ \___/|_|___/

plugins['rcarriga/nvim-notify'] = { config = ui.notify }
plugins['nvim-telescope/telescope.nvim'] = {
  opt = true,
  after = 'plenary.nvim',
  requires = {
    { 'sharkdp/fd' },
    { 'BurntSushi/ripgrep' },
    { 'jvgrootveld/telescope-zoxide' },
  },
  config = tools.telescope,
}
plugins['ziontee113/icon-picker.nvim'] = {
  opt = true,
  event = 'InsertEnter',
  setup = mapping.icon_picker(),
  requires = 'stevearc/dressing.nvim',
  config = function()
    require('icon-picker')
  end,
}
plugins['ziontee113/color-picker.nvim'] = {
  opt = true,
  event = 'InsertEnter',
  setup = mapping.color_picker(),
  config = function()
    require('color-picker')
  end,
}
plugins['akinsho/toggleterm.nvim'] = { config = tools.toggleterm }

-- _   _ ___
-- | | | |_ _|
-- | | | || |      User Interface
-- | |_| || |
--  \___/|___|

plugins['iamcco/markdown-preview.nvim'] = {
  run = 'cd app && yarn install',
  setup = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}
plugins['goolord/alpha-nvim'] = { config = ui.alpha }
plugins['lukas-reineke/indent-blankline.nvim'] = {
  after = 'nvim-treesitter',
  config = ui.blankline,
}
plugins['noib3/nvim-cokeline'] = {
  opt = true,
  event = 'UIEnter',
  setup = mapping.cokeline(),
  config = ui.cokeline,
}
plugins['catppuccin/nvim'] = { as = 'catppuccin', config = ui.catppuccin }
plugins['kevinhwang91/nvim-ufo'] = {
  requires = 'kevinhwang91/promise-async',
  after = { 'nvim-treesitter', 'nvim-lspconfig' },
  config = ui.fold,
}
plugins['SmiteshP/nvim-navic'] = {
  opt = true,
  event = 'BufReadPre',
  config = ui.navic,
}
plugins['anuvyklack/hydra.nvim'] = {
  opt = true,
  event = 'BufRead',
  requires = 'anuvyklack/keymap-layer.nvim',
  config = tools.hydra,
}
plugins['kosayoda/nvim-lightbulb'] = {
  opt = true,
  requires = 'antoinemadec/FixCursorHold.nvim',
  after = 'nvim-lspconfig',
  config = ui.lightbulb,
}
plugins['glepnir/galaxyline.nvim'] = {
  event = 'BufWinEnter',
  config = galaxyline.statusline,
}
plugins['EdenEast/nightfox.nvim'] = { config = ui.nightfox }
plugins['shaunsingh/nord.nvim'] = { config = ui.nord }
plugins['kyazdani42/nvim-tree.lua'] = {
  opt = true,
  config = function()
    require('nvim-tree').setup()
  end,
}
plugins['folke/tokyonight.nvim'] = { config = ui.tokyonight }
plugins['xiyaowong/nvim-transparent'] = { config = ui.transparent }
plugins['folke/twilight.nvim'] = { event = 'CursorMoved', config = ui.twilight }
plugins['gelguy/wilder.nvim'] = {
  opt = true,
  event = { 'CmdwinEnter', 'CmdlineEnter' },
  requires = {
    { 'roxma/nvim-yarp', run = ':UpdateRemotePlugins' },
    'roxma/vim-hug-neovim-rpc',
    'romgrk/fzy-lua-native',
  },
  config = ui.wilder,
}

--   ____                      _      _   _
--  / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __
-- | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \   Completion
-- | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
--  \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
--                      |_|

plugins['hrsh7th/nvim-cmp'] = {
  requires = {
    { 'zbirenbaum/copilot.lua', after = 'nvim-cmp', opt = true },
    {
      'zbirenbaum/copilot-cmp',
      after = { 'nvim-cmp', 'copilot.lua' },
      opt = true,
    },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', opt = true },
    {
      'saadparwaiz1/cmp_luasnip',
      after = { 'LuaSnip', 'nvim-cmp' },
      opt = true,
    },
    { 'hrsh7th/cmp-emoji', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-nvim-lsp', event = 'BufRead', opt = true },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', opt = true },
    { 'octaltree/cmp-look', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp', opt = true },
    { 'f3fora/cmp-spell', after = 'nvim-cmp', opt = true },
    { 'onsails/lspkind-nvim', after = 'nvim-cmp', opt = true },
  },
  after = 'LuaSnip',
  config = completion.cmp,
}
plugins['L3MON4D3/LuaSnip'] = {
  event = 'InsertEnter',
  config = completion.snippets,
}
plugins['rafamadriz/friendly-snippets'] = {
  opt = true,
  after = 'LuaSnip',
  event = 'InsertEnter',
}
plugins['github/copilot.vim'] = { event = 'InsertEnter' }
plugins['neovim/nvim-lspconfig'] = { opt = true, after = 'nvim-lsp-installer' }
plugins['mhartington/formatter.nvim'] = {
  opt = true,
  after = 'nvim-lspconfig',
  config = completion.formatting,
}
plugins['ray-x/lsp_signature.nvim'] = {
  opt = true,
  after = 'nvim-lspconfig',
  config = completion.signature,
}
plugins['williamboman/nvim-lsp-installer'] = {
  after = 'cmp-nvim-lsp',
  config = completion.lsp_installer,
}
plugins['RishabhRD/nvim-lsputils'] = {
  opt = true,
  requires = { 'RishabhRD/popfix' },
  config = completion.lsputils,
}
plugins['michaelb/sniprun'] = { run = 'bash ./install.sh &' }
plugins['folke/trouble.nvim'] = { opt = true, after = 'nvim-lspconfig' }

plugins['mbbill/undotree'] = { event = 'TextChanged' }
plugins['vimwiki/vimwiki'] = { opt = true, ft = 'markdown' }
plugins['rhysd/accelerated-jk'] = {}
plugins['itchyny/vim-cursorword'] = {}
plugins['dstein64/vim-startuptime'] = {}
return plugins
