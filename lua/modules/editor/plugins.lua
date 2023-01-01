local plugin = require('core.pack').register_plugin
local conf = require 'modules.editor.config'
local function is_gitrepo()
  local is_repo = vim.fn.system 'git rev-parse --is-inside-work-tree'
  if vim.v.shell_error == 0 then
    return true
  end
  return false
end

plugin { 'Pocco81/AutoSave.nvim', config = conf.autosave }
plugin { 'rmagatti/auto-session', config = conf.autosession }
plugin {
  'famiu/bufdelete.nvim',
  event = 'BufDelete',
}
plugin { 'max397574/better-escape.nvim', event = 'InsertEnter', config = conf.better_escape }
plugin {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {}
  end,
}
plugin { 'sindrets/diffview.nvim', config = conf.diffview, cond = is_gitrepo }
plugin { 'lewis6991/gitsigns.nvim', config = conf.gitsigns, cond = is_gitrepo }
plugin {
  'phaazon/hop.nvim',
  branch = 'v2',
  event = 'BufEnter',
  config = function()
    require('hop').setup {
      keys = 'thequickbrownfoxjumpsoverthelazydog',
    }
  end,
}
plugin { 'terrortylor/nvim-comment', config = conf.comment }
plugin { 'kyazdani42/nvim-web-devicons' }
plugin { 'nvim-treesitter/nvim-treesitter', event = 'BufRead', run = ':TSUpdate', config = conf.treesitter }
plugin { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' }
plugin { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
plugin { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
plugin { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
plugin { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
plugin { 'andymass/vim-matchup', after = 'nvim-treesitter' }
plugin { 'romgrk/nvim-treesitter-context', after = 'nvim-treesitter', config = conf.ts_context }
-- plugin { 'Jxstxs/conceal.nvim', after = 'nvim-treesitter', config = conf.conceal }
plugin { 'abecodes/tabout.nvim', after = 'nvim-cmp', config = conf.tabout }
