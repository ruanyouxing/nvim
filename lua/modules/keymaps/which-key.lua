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
            keys = '<leader>s',
          }
        end,
        desc = 'Flash mode',
      },
      {
        '<leader>l',
        function()
          require('which-key').show { keys = '<leader>l' }
        end,
        desc = 'LSP',
      },
      {
        mode = 'n',
        '<leader>F',
        function()
          require 'modules.keymaps.ufo'
          require('which-key').show { keys = '<leader>F' }
        end,
        desc = 'Fold mode',
      },
      {
        '<leader>g',
        function()
          require 'modules.keymaps.git'
          require('which-key').show {
            keys = '<leader>g',
          }
        end,
        desc = 'Git',
      },
      {
        '<leader>m',
        function()
          require 'modules.keymaps.mark'
          require('which-key').show {
            keys = '<leader>m',
          }
        end,
        desc = 'Marks',
      },
      {
        '<M-l>',
        function()
          require 'modules.keymaps.lazy'
          require('which-key').show {
            keys = '<M-l>',
          }
        end,
        desc = 'Lazy.nvim',
      },
      {
        '<M-c>',
        function()
          require 'modules.keymaps.competitest'
          require('which-key').show { keys = '<M-c>' }
        end,
        desc = 'Competitest',
      },
      {
        '<leader>S',
        function()
          require('which-key').add {
            {
              '<leader>Ss',
              function()
                require('persisted').save { override = true }
                require('trailblazer').save_trailblazer_state_to_file()
              end,
            },
            desc = 'Save session',
          }
          require('which-key').show {
            keys = '<leader>S',
          }
        end,
      },
    },
  },
}
