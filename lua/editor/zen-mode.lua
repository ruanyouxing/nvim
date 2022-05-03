local zen_mode = require('zen-mode')

local cfg= {
  window = {
    backdrop = 0.8,
    width = 120,
    height = 1,
    options = {
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false},
    tmux = { enabled = false }, -- disables the tmux statusline
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  },
  on_open = function(win)
  end,
  on_close = function()
  end,
}


zen_mode.setup(cfg)
