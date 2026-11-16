local wk = require 'which-key'
local jump_modes = { 'n', 'o', 'x', 'v' }
wk.add {
  {
    '<leader>Ss',
    mode = jump_modes,
    function()
      require('flash').jump()
    end,
    desc = 'Flash Jump',
  },

  {
    '<leader>SS',
    mode = jump_modes,
    function()
      require('flash').treesitter()
    end,
    desc = 'Flash Treesitter',
  },
  {
    '<leader>Sh',
    mode = jump_modes,
    function()
      require('flash').jump { search = { forward = false, wrap = false, multi_window = false } }
    end,
    desc = 'Flash backward',
  },
  {
    '<leader>Sh',
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
    desc = 'Flash forward',
  },

  {
    '<leader>S<leader>',
    mode = jump_modes,
    function()
      require('flash').jump {
        search = { mode = 'search', max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = '^',
      }
    end,
    desc = 'Flash Lines',
  },
}
