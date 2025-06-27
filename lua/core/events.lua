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
    require 'modules.ui.cokeline'
  end,
})
autocmd(User, {
  pattern = 'PersistedLoadPost',
  callback = function()
    SessionStatus = { { '   Session loaded', 'SessionHL' } }
    require 'trailblazer'
    vim.notify 'Session loaded'
    SessionStatus = { { ' 󰸞 ', 'SessionHL' } }
  end,
})
autocmd(User, {
  pattern = 'PersistedSavePost',
  callback = function()
    require('trailblazer').save_trailblazer_state_to_file()
    vim.notify 'Session saved'
    SessionStatus = { { ' 󰉉 ', 'SessionHL' } }
  end,
})
autocmd(User, {
  pattern = 'PersistedDeletePost',
  callback = function()
    vim.notify 'Session removed'
    SessionStatus = { { ' 󰩹 ', 'SessionHL' } }
  end,
})
autocmd({ 'LspAttach' }, {
  callback = function()
    require('null-ls').enable {}
  end,
})
autocmd({ 'FileType' }, {
  pattern = 'css',
  callback = function()
    vim.cmd [[ColorizerToggle]]
  end,
})
-- vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
--   pattern = '*',
--   callback = function()
--     require('specs').show_specs()
--   end,
-- })

