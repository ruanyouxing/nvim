require 'modules.keymaps.lsp'
return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show {}
        end,
      },
      {
        '<leader>s',
        function()
          require 'modules.keymaps.flash'
          require('which-key').show {
            keys = '<leader>S',
          }
        end,
        desc = 'Flash mode',
      },
      {
        '<leader>l',
        function()
          require('which-key').show { keys = '<leader>L' }
        end,
        desc = 'LSP Hydra',
      },
      {
        mode = 'n',
        '<S-f>',
        function()
          require 'modules.keymaps.ufo'
          require('which-key').show { keys = '<M-F>' }
        end,
        desc = 'Fold mode'
      },
    },
  },
}
