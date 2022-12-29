local plugin = require('core.pack').register_plugin
local conf = require 'modules.lang.config'
plugin { 'LnL7/vim-nix', ft = 'nix' }
plugin { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'org', 'norg' }, config = conf.headlines }
plugin {
  'iamcco/markdown-preview.nvim',
  run = 'cd app && yarn install',
  setup = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}
plugin { 'Pocco81/HighStr.nvim', ft = { 'markdown', 'neorg' } }
plugin { 'elkowar/yuck.vim', ft = 'yuck' }
return plugin
