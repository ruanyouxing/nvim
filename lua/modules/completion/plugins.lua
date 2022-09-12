local plugin = require('core.pack').register_plugin
local conf = require 'modules.completion.config'
local null_ls = require 'modules.completion.formatting'

plugin { 'windwp/nvim-autopairs', after = 'nvim-cmp', config = conf.autopairs }
plugin {
  'hrsh7th/nvim-cmp',
  requires = {
    { 'kdheepak/cmp-latex-symbols', after = 'nvim-cmp', opt = true },
    { 'ray-x/cmp-treesitter', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', opt = true },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-emoji', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-nvim-lsp', event = 'BufRead', opt = true },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', opt = true },
    { 'octaltree/cmp-look', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp', opt = true },
    { 'f3fora/cmp-spell', after = 'nvim-cmp', opt = true },
  },
  after = 'LuaSnip',
  config = conf.cmp,
}
plugin { 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.snippets }
plugin { 'rafamadriz/friendly-snippets', opt = true, after = 'nvim-cmp' }
plugin { 'neovim/nvim-lspconfig', opt = true, after = 'nvim-lsp-installer' }
plugin { 'jose-elias-alvarez/null-ls.nvim', opt = true, after = 'nvim-lspconfig', config = null_ls.setup }
plugin { 'ray-x/lsp_signature.nvim', opt = true, after = 'nvim-lspconfig' }
plugin { 'williamboman/nvim-lsp-installer', after = 'cmp-nvim-lsp', config = conf.lsp_installer }
plugin { 'RishabhRD/nvim-lsputils', opt = true, requires = { 'RishabhRD/popfix' }, config = conf.lsputils }
plugin { 'folke/trouble.nvim', opt = true, after = 'nvim-lspconfig' }
