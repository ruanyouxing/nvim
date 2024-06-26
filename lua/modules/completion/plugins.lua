local plugin = require('core.pack').package
local conf = require 'modules.completion.config'
local null_ls = require 'modules.completion.formatting'
plugin { 'windwp/nvim-autopairs', config = conf.autopairs, event = 'InsertEnter' }
plugin {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'kdheepak/cmp-latex-symbols', lazy = true },
    { 'ray-x/cmp-treesitter',       lazy = true },
    { 'hrsh7th/cmp-buffer',         lazy = true },
    { 'hrsh7th/cmp-calc',           lazy = true },
    { 'saadparwaiz1/cmp_luasnip',   lazy = true },
    { 'hrsh7th/cmp-emoji',          lazy = true },
    { 'hrsh7th/cmp-nvim-lsp',       lazy = true },
    { 'hrsh7th/cmp-nvim-lua',       lazy = true },
    { 'octaltree/cmp-look',         lazy = true },
    { 'hrsh7th/cmp-path',           lazy = true },
    { 'f3fora/cmp-spell',           lazy = true },
    { 'yutkat/cmp-mocword', event = 'InsertEnter' }, -- requires mocword binary & mocword dataset 
    -- { 'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'CmdlineEnter', lazy = true }, --use @ to find document symbols in find mode
  },
  config = conf.cmp,
  lazy = true,
}
plugin { 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.snippets }
plugin {
  'TwIStOy/luasnip-snippets',
  event = 'InsertEnter',
  dependencies = 'L3MON4D3/LuaSnip',
  config = conf.snippets_extenders,
}
plugin { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }
plugin { 'nvimtools/none-ls.nvim', config = null_ls.setup, event = 'BufRead' }
