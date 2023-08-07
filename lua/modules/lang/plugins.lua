local plugin = require('core.pack').package
local conf = require 'modules.lang.config'
local lsp = require 'modules.lang.lsp'
plugin { 'p00f/clangd_extensions.nvim', lazy = true }
plugin { 'williamboman/mason-lspconfig.nvim', event = 'BufRead', config = lsp.lspconfig }
plugin {
  'williamboman/mason.nvim',
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      cmd = 'Mason',
      config = lsp.mason,
    },
  },
  event = 'BufRead',
}

plugin { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'org', 'norg' }, config = conf.headlines }
plugin { 'neovim/nvim-lspconfig', lazy = true }
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
