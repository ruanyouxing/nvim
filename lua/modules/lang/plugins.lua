local plugin = require('core.pack').package
local conf = require 'modules.lang.config'
local lsp = require 'modules.lang.lsp'
plugin { 'p00f/clangd_extensions.nvim', ft = {'c','cpp'}, config = conf.clangd_exts }
plugin {
  -- 'dundalek/lazy-lsp.nvim',
  'ruanyouxing/lazy-lsp.nvim',
  dependencies = { 'nvim-lspconfig' },
  lazy = true;
}
plugin { 'LnL7/vim-nix', ft = 'nix' }
plugin { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'org', 'norg' }, config = conf.headlines }
plugin { 'neovim/nvim-lspconfig', config = lsp.lspconfig, event = 'BufRead' }
plugin {
  'RishabhRD/nvim-lsputils',
  dependencies = { 'RishabhRD/popfix', lazy = true },
  config = lsp.lsputils,
  event = 'BufRead',
}
plugin {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}
plugin { 'Pocco81/HighStr.nvim', ft = { 'markdown', 'neorg' } }
plugin { 'elkowar/yuck.vim', ft = 'yuck' }
plugin { 'nathom/filetype.nvim', config = conf.filetypes, event = { 'BufRead', 'BufNewFile' } }
plugin { 'folke/trouble.nvim', lazy = true, command = 'TroubleToggle' }
return plugin
