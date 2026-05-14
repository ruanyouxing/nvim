_G.SessionStatus = ""
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
    _G.SessionStatus = ' Session loaded'
    require 'trailblazer'
    vim.notify 'Session loaded'
    _G.SessionStatus = '󰸞 '
  end,
})

autocmd(User, {
  pattern = 'PersistedSavePost',
  callback = function()
    require('trailblazer').save_trailblazer_state_to_file()
    vim.notify 'Session saved'
    _G.SessionStatus = '󰉉 '
  end,
})

autocmd(User, {
  pattern = 'PersistedDeletePost',
  callback = function()
    vim.notify 'Session removed'
    _G.SessionStatus = '󰩹 '
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
local treesitter_augroup = vim.api.nvim_create_augroup("nvim_treesitter", { clear = true })
autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
