local autocmd = vim.api.nvim_create_autocmd
local all = '*'
local User = { 'User' }
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
autocmd(User, {
  pattern = 'PersistedLoadPost',
  callback = function()
    SessionStatus = { { '   Session loaded', 'SessionHL' } }
    require('trailblazer')
  end,
})
autocmd(User, {
  pattern = 'PersistedSavePost',
  callback = function()
    require('trailblazer').save_trailblazer_state_to_file()
    vim.notify 'Session saved'
    SessionStatus = { { '   Session saved', 'SessionHL' } }
  end,
})
autocmd(User, {
  pattern = 'PersistedDeletePost',
  callback = function()
    vim.notify 'Session saved'
    SessionStatus = { { '  ﳠ Session deleted', 'SessionHL' } }
  end,
})
