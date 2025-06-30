local plug = require('core.keymap').plug
plugin {
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup {
      check_ts = true,
    }
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
  end,
  event = 'InsertEnter',
}
plugin { 'andymass/vim-matchup', event = 'BufRead' }
plugin {
  'abecodes/tabout.nvim',
  event = 'InsertEnter',
  config = function()
    require('tabout').setup {
      tabkey = '<Tab>',
      backwards_tabkey = '<S-Tab>',
      ignore_beginning = false,
      act_as_tab = true,
      enable_backward = true,
      completion = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = '`', close = '`' },
        { open = '(', close = ')' },
        { open = '{', close = '}' },
        { open = '<', close = '>' },
        { open = '[', close = ']' },
      },
      exclude = {},
    }
  end,
}
plugin {
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
plugin {
  'max397574/better-escape.nvim',
  event = 'InsertEnter',
  config = function()
    require('better_escape').setup {
      default_mappings = true,
      timeout = 100,
    }
  end,
}
plugin {
  'terrortylor/nvim-comment',
  config = function()
    require('nvim_comment').setup {
      comment_empty = false,
      create_mappings = true,
      line_mapping = 'gcc',
      operator_mapping = 'gc',
      hook = function()
        require('ts_context_commentstring.internal').update_commentstring()
      end,
    }
  end,
  event = 'ModeChanged',
}
