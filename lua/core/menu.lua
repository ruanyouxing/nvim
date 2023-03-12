local M = {}
local keys = {}
local menu_options = {}
local add_section = function(section_info)
  menu_options[section_info[1]] = section_info[2]
  table.insert(keys, section_info[1])
end
add_section {
  'Telescope',
  function()
    vim.cmd [[Telescope]]
  end,
}
add_section {
  'Telescope: Find in buffer',
  function()
    vim.cmd [[Telescope current_buffer_fuzzy_find]]
  end,
}
add_section {
  'Telescope: List sessions',
  function()
    vim.cmd [[Telescope persisted]]
  end,
}
add_section {
  'Compile',
  function()
    require('keymap.config').compile_func()
  end,
}
add_section {
  'Colorschemes',
  function()
    vim.cmd [[Telescope colorscheme]]
  end,
}
add_section {
  'Debug mode',
  function()
    require('keystack').push 'debugging'
  end,
}
add_section {
  'Undo tree',
  function()
    vim.cmd [[UndotreeShow]]
  end,
}
add_section {
  'Git: blame line',
  function()
    require('gitsigns').blame_line { full = true }
  end,
}
add_section {
  'Git: show diffs',
  function()
    vim.cmd [[DiffviewOpen]]
  end,
}
add_section {
  'Git: close diffs',
  function()
    vim.cmd [[DiffviewClose]]
  end,
}
add_section {
  'Git: Toggle blame current line',
  function()
    require('gitsigns').toggle_current_line_blame()
  end,
}
add_section {
  'Git: stage hunk',
  function()
    require('gitsigns').stage_hunk()
  end,
}
add_section {
  'Git: undo stage hunk',
  function()
    require('gitsigns').undo_stage_hunk()
  end,
}
add_section {
  'Git: reset hunk',
  function()
    require('gitsigns').reset_hunk()
  end,
}
add_section {
  'Git: show',
  function()
    require('gitsigns').show()
  end,
}
add_section {
  'Git: diffthis',
  function()
    require('gitsigns').diffthis()
  end,
}
add_section {
  'Git: stage buffers',
  function()
    require('gitsigns').stage_buffer()
  end,
}
add_section {
  'Git: reset buffer',
  function()
    require('gitsigns').reset_buffer()
  end,
}
add_section {
  'Git: preview hunk',
  function()
    require('gitsigns').preview_hunk()
  end,
}
add_section {
  'Git: Toggle deleted',
  function()
    require('gitsigns').toggle_deleted()
  end,
}
add_section {
  'Lazy: update',
  function()
    require('lazy').update()
  end,
}
add_section {
  'Lazy: sync',
  function()
    require('lazy').sync()
  end,
}
add_section {
  'Lazy: profile',
  function()
    require('lazy').profile()
  end,
}
add_section {
  'Lazy',
  function()
    require('lazy').show()
  end,
}
add_section {
  'Lazy: clean/uninstall',
  function()
    require('lazy').clean()
  end,
}
add_section {
  'Treesitter Playground',
  function()
    require('nvim-treesitter-playground.internal').toggle()
  end,
}
add_section {
  'Treesitter: Node under cursor',
  function()
    require('nvim-treesitter-playground.hl-info').show_ts_node()
  end,
}
add_section {
  'Treesitter: Capture node under cursor',
  function()
    require('nvim-treesitter-playground.hl-info').show_hl_captures()
  end,
}
add_section {
  'Toggle zen-mode',
  function()
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
}
add_section {
  'Toggle minimap',
  function()
    require('codewindow').toggle_minimap()
  end,
}
add_section {
  'Toggle conceal',
  function()
    if vim.o.conceallevel > 0 then
      vim.o.conceallevel = 0
    else
      vim.o.conceallevel = 2
    end
  end,
}
add_section {
  'Yank history',
  function()
    require('telescope').extensions.yank_history.yank_history()
  end,
}
add_section {
  'Split buffers vertically',
  function()
    vim.cmd [[vsplit]]
  end,
}
add_section {
  'Split buffers horizontally',
  function()
    vim.cmd [[sp]]
  end,
}
add_section {
  'Close splits',
  function()
    vim.cmd [[only]]
  end,
}
add_section {
  'Hop: Select lines',
  function()
    vim.cmd [[normal! v]]
    require('hop').hint_lines()
  end,
}
add_section {
  'Hop: Select words',
  function()
    vim.cmd [[normal! v]]
    require('hop').hint_words()
  end,
}
add_section {
  'Hop: Start edit after selected line',
  function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'o'
    end)
  end,
}
add_section {
  'Hop: Start edit before selected line',
  function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'O'
    end)
  end,
}
add_section {
  'Hop: Yank/Paste before selected line',
  function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'P'
    end)
  end,
}
add_section {
  'Hop: Yank/Paste after selected line',
  function()
    require('hop').hint_lines()
    vim.schedule(function()
      vim.fn.feedkeys 'p'
    end)
  end,
}
add_section {
  'Pick a buffer',
  function()
    require('cokeline/mappings').pick 'focus'
  end,
}
add_section {
  'Close a buffer',
  function()
    require('cokeline/mappings').pick 'close'
  end,
}
add_section {
  'Spectre',
  function()
    require('spectre').open()
  end,
}
add_section {
  'Save current session',
  function()
    require('persisted').save { override = true }
    require('trailblazer').save_trailblazer_state_to_file()
  end,
}
add_section {
  'List marks',
  function()
    require('trailblazer').toggle_trail_mark_list()
  end,
}
add_section {
  'Delete all marks',
  function()
    require('trailblazer').delete_all_trail_marks()
  end,
}
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
