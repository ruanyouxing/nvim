local wk = require 'which-key'
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local jump_modes = { 'n', 'o', 'x', 'v' }
wk.add {
  {
    '<leader>sj',
    function()
      require('which-key').show {
        keys = '<leader>sj',
      }
    end,
    desc = 'Jump',
  },
  {
    '<leader>sjs',
    mode = jump_modes,
    function()
      require('flash').jump()
    end,
    desc = 'Flash Jump',
  },

  {
    '<leader>sjS',
    mode = jump_modes,
    function()
      require('flash').treesitter()
    end,
    desc = 'Treesitter Jump',
  },
  {
    '<leader>sjh',
    mode = jump_modes,
    function()
      require('flash').jump { search = { forward = false, wrap = false, multi_window = false } }
    end,
    desc = 'Flash backward',
  },
  {
    '<leader>sjl',
    mode = jump_modes,
    function()
      require('flash').jump {
        search = {
          forward = true,
          wrap = false,
          multi_window = false,
        },
      }
    end,
    desc = 'Jump forward',
  },

  {
    '<leader>sjL',
    mode = jump_modes,
    function()
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
    desc = 'Jump to line',
  },
  {
    '<leader>sjw',
    mode = jump_modes,
    function()
      require('flash').jump()
    end,
    desc = 'Jump to word',
  },
  {
    '<leader>ss',
    function()
      require('which-key').show {
        keys = '<leader>ss',
      }
    end,
    desc = 'Select',
  },
  {
    '<leader>ssl',
    function()
      vim.cmd 'normal! v'
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
    desc = 'Select lines',
  },
  {
    '<leader>ssw',
    function()
      local flash = require 'flash'
      vim.cmd 'normal! v'
      flash.jump()
    end,
    desc = 'Flash: Select words',
  },
}
