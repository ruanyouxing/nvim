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
    text = 'Flash: Jump to line',
    action = function()
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
  },
  {
    text = 'Flash: Jump to word',
    action = function()
      require('flash').jump()
    end,
  },
  {
    text = 'Flash: Select lines',
    action = function()
      local flash = require 'flash'
      vim.cmd 'normal! v'
      flash.jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
  },
  {
    text = 'Flash: Select words',
    action = function()
      local flash = require 'flash'
      vim.cmd 'normal! v'
      flash.jump()
    end,
  },
  {
    text = 'Flash: Jump to line and insert below',
    action = function()
      local group = vim.api.nvim_create_augroup('FlashMenuJump', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'FlashComplete',
        group = group,
        once = true,
        callback = function()
          vim.schedule(function()
            vim.fn.feedkeys('o', 'n')
          end)
        end,
      })
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
  },
  {
    text = 'Flash: Jump to line and insert above',
    action = function()
      local group = vim.api.nvim_create_augroup('FlashMenuJump', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'FlashComplete',
        group = group,
        once = true,
        callback = function()
          vim.schedule(function()
            vim.fn.feedkeys('O', 'n')
          end)
        end,
      })
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
  },
  {
    text = 'Flash: Jump to line and paste below',
    action = function()
      local group = vim.api.nvim_create_augroup('FlashMenuJump', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'FlashComplete',
        group = group,
        once = true,
        callback = function()
          vim.schedule(function()
            vim.fn.feedkeys('p', 'n')
          end)
        end,
      })
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
  },
  {
    text = 'Flash: Jump to line and paste above',
    action = function()
      local group = vim.api.nvim_create_augroup('FlashMenuJump', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'FlashComplete',
        group = group,
        once = true,
        callback = function()
          vim.schedule(function()
            vim.fn.feedkeys('P', 'n')
          end)
        end,
      })
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
  },
  {
    text = 'Toggle conceal',
    action = function()
      vim.o.conceallevel = vim.o.conceallevel > 0 and 0 or 2
    end,
  },
  {
    text = 'Undo tree',
    action = function()
      vim.cmd 'UndotreeToggle'
    end,
  },
  {
    text = 'Yank history',
    action = function()
      Snacks.picker.yanky()
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
