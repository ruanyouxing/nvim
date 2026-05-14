local plug = require('core.keymap').plug
return { {
  'andymass/vim-matchup',
  event = 'BufRead',
  config = function()
    vim.g.matchup_treesitter = 1
    require('match-up').setup {
      treesitter = {
        stopline = 500
      }
    }
  end
}
-- , { -- Tabout for blink?
--   'abecodes/tabout.nvim',
--   event = 'InsertEnter',
--   config = function()
--     require('tabout').setup {
--       tabkey = '<Tab>',
--       backwards_tabkey = '<S-Tab>',
--       ignore_beginning = false,
--       act_as_tab = true,
--       enable_backward = true,
--       completion = true,
--       tabouts = {
--         { open = "'", close = "'" },
--         { open = '"', close = '"' },
--         { open = '`', close = '`' },
--         { open = '(', close = ')' },
--         { open = '{', close = '}' },
--         { open = '<', close = '>' },
--         { open = '[', close = ']' },
--       },
--       exclude = {},
--     }
--   end,
-- }
, {
  'gbprod/yanky.nvim',
  config = function()
    local utils = require 'yanky.utils'
    local mapping = require 'yanky.telescope.mapping'
    require('yanky').setup {
      ring = {
        history_length = 500,
        storage = 'shada',
      },
      preserve_cursor_position = {
        enabled = true,
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      picker = {
        telescope = {
          mappings = {
            default = mapping.put 'p',
            i = {
              ['<c-p>'] = mapping.put 'p',
              ['<c-k>'] = mapping.put 'P',
              ['<c-x>'] = mapping.delete(),
              ['<c-r>'] = mapping.set_register(utils.get_default_register()),
            },
            n = {
              p = mapping.put 'p',
              P = mapping.put 'P',
              d = mapping.delete(),
              r = mapping.set_register(utils.get_default_register()),
            },
          },
        },
      },
    }
  end,
  keys = {
    { 'p',  plug 'YankyPutAfter',   mode = { 'n', 'x' } },
    { 'P',  plug 'YankyPutBefore',  mode = { 'n', 'x' } },
    { 'gp', plug 'YankyGPutAfter',  mode = { 'n', 'x' } },
    { 'gP', plug 'YankyGPutBefore', mode = { 'n', 'x' } },
    { 'y',  plug 'YankyYank',       mode = { 'n', 'x' } },
    {
      '<C-S-y>',
      function()
        require('telescope').extensions.yank_history.yank_history()
      end,
    },
  },
}
, {
  'max397574/better-escape.nvim',
  event = 'InsertEnter',
  opts = {
    default_mappings = true,
    timeout = 100,
    mappings = {
      t = {
        j = {
          k = false,
          j = false,
        }
      }
    }
  }
}
,
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == "commentstring"
            and require("ts_context_commentstring.internal").calculate_commentstring()
            or get_option(filetype, option)
      end
    end
  }
}
