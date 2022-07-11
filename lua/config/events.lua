local events = {}
local autocmd = vim.api.nvim_create_autocmd
local all = '*'
local function silent(cmd)
  return 'silent! ' .. cmd
end

autocmd({ 'CursorMoved' }, { pattern = '*', command = 'IndentBlanklineRefresh' })
autocmd({ 'TextYankPost' }, {
  pattern = all,
  command = silent('lua vim.highlight.on_yank(higroup="incsearch",timeout=301)'),
})
autocmd({ 'CursorMoved' }, {
  pattern = all,
  callback = function()
    require('specs').show_specs()
  end,
})
autocmd({ 'BufEnter' }, {
  pattern = all,
  command = silent('imap <silent><expr><script> <Tab> copilot#Accept()'),
})

autocmd({ 'BufWritePost' }, {
  pattern = all,
  command = silent('FormatWrite'),
})

return events
