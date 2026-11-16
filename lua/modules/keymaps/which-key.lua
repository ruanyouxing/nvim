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
      },
      {
        '<leader>l',
        function()
          require('which-key').show { keys = '<leader>L' }
        end,
        desc = 'LSP Hydra',
      },
    },
  },
}
