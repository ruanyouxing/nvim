local plugin = require('core.pack').package
local conf = require 'modules.completion.config'
local null_ls = require 'modules.completion.formatting'

plugin { 'windwp/nvim-autopairs', config = conf.autopairs, event = 'InsertEnter' }
plugin {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'kdheepak/cmp-latex-symbols',           lazy = true },
    { 'ray-x/cmp-treesitter',                 lazy = true },
    { 'hrsh7th/cmp-buffer',                   lazy = true },
    { 'hrsh7th/cmp-calc',                     lazy = true },
    { 'saadparwaiz1/cmp_luasnip',             lazy = true },
    { 'hrsh7th/cmp-emoji',                    lazy = true },
    { 'hrsh7th/cmp-nvim-lsp',                 event = 'BufRead' },
    { 'hrsh7th/cmp-nvim-lua',                 lazy = true },
    { 'octaltree/cmp-look',                   lazy = true },
    { 'hrsh7th/cmp-path',                     lazy = true },
    { 'f3fora/cmp-spell',                     lazy = true },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'CmdlineEnter', dependencies = 'mason-lspconfig.nvim' }, --use @ to find document symbols in find mode
  },
  config = conf.cmp,
  lazy = true,
}

plugin { 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.snippets }
plugin { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }
plugin { 'jose-elias-alvarez/null-ls.nvim', config = null_ls.setup }
