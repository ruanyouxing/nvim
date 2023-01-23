local plugin = require('core.pack').package
local conf = require 'modules.completion.config'
local null_ls = require 'modules.completion.formatting'

plugin { 'windwp/nvim-autopairs', config = conf.autopairs, event = 'InsertEnter' }
plugin {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'kdheepak/cmp-latex-symbols', lazy = true },
    { 'ray-x/cmp-treesitter', lazy = true },
    { 'hrsh7th/cmp-buffer', lazy = true },
    { 'hrsh7th/cmp-calc', lazy = true },
    { 'saadparwaiz1/cmp_luasnip', lazy = true },
    { 'hrsh7th/cmp-emoji', lazy = true },
    { 'hrsh7th/cmp-nvim-lsp', lazy = true , event = 'BufRead'},
    { 'hrsh7th/cmp-nvim-lua', lazy = true },
    { 'octaltree/cmp-look', lazy = true },
    { 'hrsh7th/cmp-path', lazy = true },
    { 'f3fora/cmp-spell', lazy = true },
  },
  config = conf.cmp,
  lazy = true
}

plugin { 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.snippets }
plugin { 'rafamadriz/friendly-snippets', lazy = true }
plugin { 'neovim/nvim-lspconfig'}
plugin { 'p00f/clangd_extensions.nvim', lazy = true }
plugin { 'jose-elias-alvarez/null-ls.nvim', config = null_ls.setup }
plugin { 'ray-x/lsp_signature.nvim', lazy = true }
plugin { 'williamboman/mason-lspconfig.nvim',event = 'BufRead', config = conf.lsp_installer }
plugin {
  'RishabhRD/nvim-lsputils',
  dependencies = { 'RishabhRD/popfix', lazy = true },
  config = conf.lsputils,
  event = 'BufRead'
}
plugin { 'folke/trouble.nvim', lazy = true }
