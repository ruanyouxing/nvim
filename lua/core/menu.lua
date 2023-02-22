local M = {}
local keys = {}
local menu_options = {
  ['Telescope'] = function()
    vim.cmd [[Telescope]]
  end,
  ['Colorschemes'] = function()
    vim.cmd [[Telescope colorscheme]]
  end,
  ['Debug mode'] = function()
    require('keystack').push 'debugging'
  end,
  ['Undo tree'] = function()
    vim.cmd [[UndoTreeShow]]
  end,
  ['Git: blame line'] = function()
    require('gitsigns').blame_line { full = true }
  end,
  ['Git: Toggle blame current line'] = function()
    require('gitsigns').toggle_current_line_blame()
  end,
  ['Git: stage hunk'] = function()
    require('gitsigns').stage_hunk()
  end,
  ['Git: undo stage hunk'] = function()
    require('gitsigns').undo_stage_hunk()
  end,
  ['Git: reset hunk'] = function()
    require('gitsigns').reset_hunk()
  end,
  ['Git: show'] = function()
    require('gitsigns').show()
  end,
  ['Git: diffthis'] = function()
    require('gitsigns').diffthis()
  end,
  ['Git: stage buffers'] = function()
    require('gitsigns').stage_buffer()
  end,
  ['Git: reset buffer'] = function()
    require('gitsigns').reset_buffer()
  end,
  ['Git: preview hunk'] = function()
    require('gitsigns').preview_hunk()
  end,
  ['Git: Toggle deleted'] = function()
    require('gitsigns').toggle_deleted()
  end,
  ['Lazy: update'] = function()
    require('lazy').update()
  end,
  ['Lazy: sync'] = function()
    require('lazy').sync()
  end,
  ['Lazy: profile'] = function()
    require('lazy').profile()
  end,
  ['Lazy'] = function()
    require('lazy').show()
  end,
  ['Lazy: clean/uninstall'] = function()
    require('lazy').clean()
  end,
  ['Treesitter Playground'] = function()
    require('nvim-treesitter-playground.internal').toggle()
  end,
  ['Treesitter: Node under cursor'] = function()
    require('nvim-treesitter-playground.hl-info').show_ts_node()
  end,
  ['Treesitter: Capture node under cursor'] = function()
    require('nvim-treesitter-playground.hl-info').show_hl_captures()
  end,
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
  ['Yank history'] = function()
    require('telescope').extensions.yank_history.yank_history()
  end,
  ['Split buffers '] = function()
    vim.cmd [[vsplit]]
  end,
  ['Close splits'] = function()
    vim.cmd [[only]]
  end,
  ['Hop: Select lines'] = function()
    vim.cmd [[normal! v]]
    require('hop').hint_lines()
  end,
  ['Hop: Select words'] = function()
    vim.cmd [[normal! v]]
    require('hop').hint_words()
  end,
  ['Hop: Start edit after selected line'] = function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'o'
    end)
  end,
  ['Hop: Start edit before selected line'] = function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'O'
    end)
  end,
  ['Hop: Yank/Paste before selected line'] = function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'P'
    end)
  end,
  ['Hop: Yank/Paste after selected line'] = function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'p'
    end)
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
