local autocmd = vim.api.nvim_create_autocmd
local all = '*'

autocmd({ 'TextYankPost' }, {
  pattern = all,
  callback = function()
    vim.highlight.on_yank()
  end,
})
