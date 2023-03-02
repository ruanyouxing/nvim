local autocmd = vim.api.nvim_create_autocmd
local all = '*'
autocmd({ 'TextYankPost' }, {
  pattern = all,
  callback = function()
    vim.highlight.on_yank()
  end,
})
autocmd({ 'ColorScheme' }, {
  pattern = all,
  callback = function()
    require('modules.ui.config').cokeline()
  end,
})
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'PersistedSavePost',
  group = vim.api.nvim_create_augroup('PersistedHooks', {}),
  callback = function()
    vim.notify 'Session saved'
  end,
})
