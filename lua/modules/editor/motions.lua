local jump_modes = { 'n', 'o', 'x', 'v' }
return {
  {
    'chrisgrieser/nvim-spider',
    keys = {
      {
        mode = jump_modes,
        'w',
        function()
          require('spider').motion('w')
        end
      },
      {
        mode = jump_modes,
        'e',
        function()
          require('spider').motion('e')
        end
      },
      {
        mode = jump_modes,
        'b',
        function()
          require('spider').motion('b')
        end
      },
      {
        mode = jump_modes,
        'ge',
        function()
          require('spider').motion('ge')
        end
      },
    },
  },
---@type "Flash.Config"
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          enabled = false,
          jump_labels = true,
        }
      },
      label = {
        rainbow = {
          enabled = true,
          shade = 9,
        },
        uppercase = false,
      }
    },
    keys = {
      { "s", mode = jump_modes, function() require("flash").jump() end,       desc = "Flash Jump" },

      { "S", mode = jump_modes, function() require("flash").treesitter() end, desc = "Flash Treesitter" }, {
      'H',
      mode = jump_modes,
      function()
        require('flash').jump {
          search = {
            forward = false,
            wrap = false,
            multi_window = false
          }
        }
      end
    },
      {
        'L',
        mode = jump_modes,
        function()
          require('flash').jump {
            search = {
              forward = true,
              wrap = false,
              multi_window = false
            } }
        end
      },

      {
        "<S-Space>",
        mode = jump_modes,
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^"
          })
        end,
        desc = "Flash Lines"
      },
    },
  },
}
