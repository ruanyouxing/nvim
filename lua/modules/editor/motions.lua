local jump_modes = { 'n', 'o', 'x', 'v' }
return {
  {
    'chrisgrieser/nvim-spider',
    keys = {
      {
        mode = jump_modes,
        'w',
        function()
          require('spider').motion 'w'
        end,
      },
      {
        mode = jump_modes,
        'e',
        function()
          require('spider').motion 'e'
        end,
      },
      {
        mode = jump_modes,
        'b',
        function()
          require('spider').motion 'b'
        end,
      },
      {
        mode = jump_modes,
        'ge',
        function()
          require('spider').motion 'ge'
        end,
      },
    },
  },
  ---@type "Flash.Config"
  {
    'folke/flash.nvim',
    lazy = true,
    -- event = 'VeryLazy',
    opts = {
      modes = {
        char = {
          enabled = false,
          jump_labels = true,
        },
      },
      label = {
        rainbow = {
          enabled = true,
          shade = 9,
        },
        uppercase = false,
      },
    },
  },
}
