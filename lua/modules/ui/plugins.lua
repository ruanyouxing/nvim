---@diagnostic disable: different-requires
local plugin = require('core.pack').package
local conf = require 'modules.ui.config'
local config_list = { 'themes', 'lsp_ui', 'notification', 'wilder', 'cokeline', 'windline', 'blankline', 'dashboard' }
for _, v in ipairs(config_list) do
  require('modules.ui.' .. v)
end
plugin { 'tzachar/local-highlight.nvim', config = conf.highlight, event = 'BufRead', dependencies = 'folke/snacks.nvim' }
plugin {
  'typicode/bg.nvim',
}
plugin { 'stevearc/dressing.nvim', config = conf.dressing }
plugin { 'gorbit99/codewindow.nvim', config = conf.minimap, event = 'BufRead' }
plugin { 'yamatsum/nvim-cursorline', config = conf.cursorline }
plugin { 'cxwx/specs.nvim', event = 'UIEnter', config = conf.specs }
plugin { 'mvllow/modes.nvim', event = 'UIEnter', config = conf.modes }
plugin {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()
  end,
  cmd = 'NvimTreeToggle',
}
plugin { 'folke/twilight.nvim', event = 'CursorMoved', config = conf.twilight }
plugin {
  'lukas-reineke/virt-column.nvim',
  event = 'UIEnter',
  config = function()
    require('virt-column').setup()
  end,
}
plugin { 'mrjones2014/smart-splits.nvim', config = conf.splits, build = './kitty/install-kittens.bash' }
plugin { 'luukvbaal/statuscol.nvim', config = conf.statuscol, event = 'BufWinEnter' }
-- plugin { 'Pheon-Dev/pigeon', lazy = true }
