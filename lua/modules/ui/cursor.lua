plugin {
  'yamatsum/nvim-cursorline',
  config = function()
    require('nvim-cursorline').setup {
      curosrline = { enable = true, timeout = 100, number = false },
      cursorword = { enable = true, min_length = 3, hl = { underline = true } },
    }
  end,
}
plugin {
  'cxwx/specs.nvim',
  event = 'UIEnter',
  config = function()
    require('specs').setup {
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
    vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
      pattern = '*',
      callback = function()
        require('specs').show_specs()
      end,
    })
  end,
}
