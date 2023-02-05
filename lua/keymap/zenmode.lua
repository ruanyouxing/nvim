---@diagnostic disable: different-requires
_G.OnFocus = 0
local function load_autocmds()
  local autocmd = vim.api.nvim_create_autocmd
  vim.api.nvim_create_augroup('galaxyline', { clear = true })
  local options = {
    pattern = '*',
    group = 'galaxyline',
    callback = function()
      require('galaxyline').load_galaxyline()
    end,
  }
  local events = {
    'BufEnter',
    'BufReadPost',
    'BufWinEnter',
    'BufWritePost',
    'ColorScheme',
    'FileChangedShellPost',
    'FileType',
    'TermOpen',
    'VimResized',
    'WinEnter',
  }
  autocmd(events, options)
  autocmd({ 'WinLeave' }, {
    pattern = '*',
    group = 'galaxyline',
    callback = function()
      require('galaxyline').inactive_galaxyline()
    end,
  })
end

vim.keymap.set('n', '<F11>', function()
  if OnFocus == 0 then
    OnFocus = 1
    vim.api.nvim_del_augroup_by_name 'galaxyline'
    vim.o.statusline = 0
    vim.cmd [[TZAtaraxis]]
  else
    vim.cmd [[TZAtaraxis]]
    require('galaxyline').load_galaxyline()
    load_autocmds()
    require('codewindow').open_minimap()
    OnFocus = 0
  end
end, { noremap = true, silent = true })
