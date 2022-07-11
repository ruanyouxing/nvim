local plugins = pcall(require, 'packer_compiled')
if not plugins then
  print('recompile')
  require('packer').compile()
  vim.defer_fn(function()
    print('Packer recompiled, please run :PackerCompile and restart nvim')
  end, 400)
  return
end
local load = require('packer').loader
local fn = vim.fn
load('plenary.nvim')
load('nvim-tree.lua')
local function is_gitrepo()
  local is_repo = fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    return true
  end
  return false
end

if is_gitrepo() == true then
  load('gitsigns.nvim')
  load('diffview.nvim')
end
