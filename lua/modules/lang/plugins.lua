local plugin = require('core.pack').package
local conf = require 'modules.lang.config'
plugin { 'LnL7/vim-nix', ft = 'nix' }
plugin { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'org', 'norg' }, config = conf.headlines }
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
return plugin
