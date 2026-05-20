local M = {}

local menu_items = {
  {
    text = 'Colorizer',
    action = function()
      vim.cmd 'ColorizerToggle'
    end,
  },
  {
    text = 'Colorschemes',
    action = function()
      Snacks.picker.colorschemes()
    end,
  },
  {
    text = 'Compile',
    action = function()
      require('keymap.config').compile_func()
    end,
  },
  {
    text = 'Close splits',
    action = function()
      vim.cmd 'only'
    end,
  },
  {
    text = 'Close a buffer',
    action = function()
      require('cokeline/mappings').pick 'close'
    end,
  },
  {
    text = 'Competitest: Add a testcase',
    action = function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest add_testcase'
    end,
  },
  {
    text = 'Competitest: Delete a testcase',
    action = function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest delete_testcase'
    end,
  },
  {
    text = 'Competitest: Edit a testcase',
    action = function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest edit_testcase'
    end,
  },
  {
    text = 'Competitest: Run testcases',
    action = function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest run'
    end,
  },
  {
    text = 'Debug mode',
    action = function()
      require('keystack').push 'debugging'
    end,
  },
  {
    text = 'Delete all marks',
    action = function()
      require('trailblazer').delete_all_trail_marks()
    end,
  },
  {
    text = 'Git: Toggle blame current line',
    action = function()
      require('gitsigns').toggle_current_line_blame()
    end,
  },
  {
    text = 'Git: Toggle deleted',
    action = function()
      require('gitsigns').toggle_deleted()
    end,
  },
  {
    text = 'Git: blame line',
    action = function()
      require('gitsigns').blame_line { full = true }
    end,
  },
  {
    text = 'Git: close diffs',
    action = function()
      vim.cmd 'DiffviewClose'
    end,
  },
  {
    text = 'Git: diffthis',
    action = function()
      require('gitsigns').diffthis()
    end,
  },
  {
    text = 'Git: preview hunk',
    action = function()
      require('gitsigns').preview_hunk()
    end,
  },
  {
    text = 'Git: reset buffer',
    action = function()
      require('gitsigns').reset_buffer()
    end,
  },
  {
    text = 'Git: reset hunk',
    action = function()
      require('gitsigns').reset_hunk()
    end,
  },
  {
    text = 'Git: show',
    action = function()
      require('gitsigns').show()
    end,
  },
  {
    text = 'Git: show diffs',
    action = function()
      vim.cmd 'DiffviewOpen'
    end,
  },
  {
    text = 'Git: stage buffers',
    action = function()
      require('gitsigns').stage_buffer()
    end,
  },
  {
    text = 'Git: stage hunk',
    action = function()
      require('gitsigns').stage_hunk()
    end,
  },
  {
    text = 'Git: undo stage hunk',
    action = function()
      require('gitsigns').undo_stage_hunk()
    end,
  },
  {
    text = 'Hbac: Close unpinned tabs',
    action = function()
      require('hbac').close_unpinned()
    end,
  },
  {
    text = 'Hbac: Pin this tab',
    action = function()
      require('hbac').toggle_pin()
    end,
  },
  {
    text = 'Hbac: Toggle autoclose',
    action = function()
      require('hbac').toggle_autoclose()
    end,
  },
  {
    text = 'Hop: Select lines',
    action = function()
      vim.cmd 'normal! v'
      require('hop').hint_lines()
    end,
  },
  {
    text = 'Hop: Select words',
    action = function()
      vim.cmd 'normal! v'
      require('hop').hint_words()
    end,
  },
  {
    text = 'Hop: Start edit after selected line',
    action = function()
      require('hop').hint_lines()
      vim.schedule(function()
        vim.fn.feedkeys 'o'
      end)
    end,
  },
  {
    text = 'Hop: Start edit before selected line',
    action = function()
      require('hop').hint_lines()
      vim.schedule(function()
        vim.fn.feedkeys 'O'
      end)
    end,
  },
  {
    text = 'Hop: Yank/Paste after selected line',
    action = function()
      require('hop').hint_lines()
      vim.schedule(function()
        vim.fn.feedkeys 'p'
      end)
    end,
  },
  {
    text = 'Hop: Yank/Paste before selected line',
    action = function()
      require('hop').hint_lines()
      vim.schedule(function()
        vim.fn.feedkeys 'P'
      end)
    end,
  },
  {
    text = 'Lazy',
    action = function()
      require('lazy').show()
    end,
  },
  {
    text = 'Lazy: clean/uninstall',
    action = function()
      require('lazy').clean()
    end,
  },
  {
    text = 'Lazy: profile',
    action = function()
      require('lazy').profile()
    end,
  },
  {
    text = 'Lazy: sync',
    action = function()
      require('lazy').sync()
    end,
  },
  {
    text = 'Lazy: update',
    action = function()
      require('lazy').update()
    end,
  },
  {
    text = 'List marks',
    action = function()
      require('trailblazer').toggle_trail_mark_list()
    end,
  },
  {
    text = 'Navigator',
    action = function()
      require('nvim-navbuddy').open()
    end,
  },
  {
    text = 'Pick a buffer',
    action = function()
      require('cokeline/mappings').pick 'focus'
    end,
  },
  {
    text = 'Save current session',
    action = function()
      require('persisted').save { override = true }
      require('trailblazer').save_trailblazer_state_to_file()
    end,
  },
  {
    text = 'Split buffers horizontally',
    action = function()
      vim.cmd 'sp'
    end,
  },
  {
    text = 'Split buffers vertically',
    action = function()
      vim.cmd 'vsplit'
    end,
  },
  {
    text = 'Telescope (pickers)',
    action = function()
      Snacks.picker()
    end,
  },
  {
    text = 'Pickers: Find in buffer',
    action = function()
      Snacks.picker.lines()
    end,
  },
  {
    text = 'Telescope: List sessions',
    action = function()
      vim.cmd 'Telescope persisted'
    end,
  },
  {
    text = 'Toggle conceal',
    action = function()
      vim.o.conceallevel = vim.o.conceallevel > 0 and 0 or 2
    end,
  },
  {
    text = 'Toggle minimap',
    action = function()
      require('codewindow').toggle_minimap()
    end,
  },
  {
    text = 'Treesitter Playground',
    action = function()
      require('nvim-treesitter-playground.internal').toggle()
    end,
  },
  {
    text = 'Treesitter: Capture node under cursor',
    action = function()
      require('nvim-treesitter-playground.hl-info').show_hl_captures()
    end,
  },
  {
    text = 'Treesitter: Node under cursor',
    action = function()
      require('nvim-treesitter-playground.hl-info').show_ts_node()
    end,
  },
  {
    text = 'Undo tree',
    action = function()
      vim.cmd 'UndotreeShow'
    end,
  },
  {
    text = 'Yank history',
    action = function()
      Snacks.picker.registers()
    end,
  },
}

table.sort(menu_items, function(a, b)
  return a.text < b.text
end)

M.trigger_menu = function()
  Snacks.picker {
    title = 'Command Menu',
    items = menu_items,
    format = 'text',
    confirm = function(picker, item)
      picker:close()
      if item and item.action then
        vim.schedule(function()
          item.action()
        end)
      end
    end,
  }
end

return M
