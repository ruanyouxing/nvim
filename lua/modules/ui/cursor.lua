return {
  {
    'yamatsum/nvim-cursorline',
    config = function()
      require('nvim-cursorline').setup {
        curosrline = { enable = true, timeout = 100, number = false },
        cursorword = { enable = true, min_length = 3, hl = { underline = true } },
      }
    end,
    event = 'CursorMoved',
  },
  {
    'cxwx/specs.nvim',
    lazy = true,
    opts = function()
      return {
        show_jumps = true,
        min_jump = 10,
        popup = {
          delay_ms = 0,
          inc_ms = 10,
          blend = 10,
          width = 10,
          winhl = 'PMenu',
          fader = require('specs').pulse_fader,
          resizer = require('specs').slide_resizer,
        },
        ignore_filetypes = {},
        ignore_buftypes = { nofile = true },
      }
    end,
  },
}
