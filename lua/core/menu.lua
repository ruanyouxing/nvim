local M = {}
local keys = {}
local menu_options = {
  ['Telescope'] = function()
    vim.cmd [[Telescope]]
  end,
  ['Colorschemes'] = function()
    vim.cmd [[Telescope colorscheme]]
  end,
  ['Undo tree'] = function()
    vim.cmd [[UndoTreeShow]]
  end,
  ['Git: stage hunk'] = require('gitsigns').stage_hunk,
  ['Git: undo stage hunk'] = require('gitsigns').undo_stage_hunk,
  ['Git: reset hunk'] = require('gitsigns').reset_hunk,
  ['Git: show'] = require('gitsigns').show,
  ['Git: diffthis'] = require('gitsigns').diffthis,
  ['Git: stage buffers'] = require('gitsigns').stage_buffer,
  ['Git: reset buffer'] = require('gitsigns').reset_buffer,
  ['Git: preview hunk'] = require('gitsigns').preview_hunk,
  ['Toggle zen-mode'] = function()
    if OnFocus == 0 then
      OnFocus = 1
      vim.cmd [[TZAtaraxis]]
      vim.o.statusline = 0
    else
      vim.cmd [[TZAtaraxis]]
      vim.opt.statusline = '%!v:lua.WindLine.show()'
      require('codewindow').open_minimap()
      OnFocus = 0
    end
  end,
  ['Toggle conceal'] = function()
    if vim.o.conceallevel > 0 then
      vim.o.conceallevel = 0
    else
      vim.o.conceallevel = 2
    end
  end,
}
for k, _ in pairs(menu_options) do
  table.insert(keys, k)
end
table.sort(keys)
M.trigger_menu = function()
  vim.ui.select(keys, { prompt = 'Options' }, function(item)
    if item == nil then
      return
    end
    menu_options[item]()
  end)
end
return M
