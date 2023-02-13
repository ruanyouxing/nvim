---@diagnostic disable: unused-local
local plugin = require('core.pack').package
local conf = require 'modules.editor.config'
local is_gitrepo = function()
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
plugin { 'sindrets/diffview.nvim', config = conf.diffview, cond = is_gitrepo, cmd = 'DiffviewOpen' }
plugin { 'lewis6991/gitsigns.nvim', config = conf.gitsigns, cond = is_gitrepo, event = 'BufRead' }
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
plugin { 'nvim-treesitter/nvim-treesitter', event = 'BufRead', build = ':TSUpdate', config = conf.treesitter }
plugin { 'nvim-treesitter/nvim-treesitter-refactor', event = 'BufRead' }
plugin { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufRead' }
plugin { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufRead' }
plugin { 'windwp/nvim-ts-autotag', event = 'BufRead' }
plugin { 'p00f/nvim-ts-rainbow', event = 'BufRead' }
plugin { 'andymass/vim-matchup', event = 'BufRead' }
plugin { 'romgrk/nvim-treesitter-context', event = 'BufRead', config = conf.ts_context }
plugin { 'abecodes/tabout.nvim', event = 'InsertEnter', config = conf.tabout }
