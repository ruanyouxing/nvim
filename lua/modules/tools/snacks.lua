return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = {
      enabled = true
    },
    terminal = {
      enabled = true,
      shell = "zsh",
      win = {
        position = "bottom",
        height = 7,
        border = "rounded",
        wo = {
          winbar = '',
          number = false,
          relativenumber = false,
        },
      },
      opts = {
        auto_close = true,
      },
    },
    lazygit = {
      configure = true,
      win = {
        style = 'lazygit',
        border = "rounded",
        position = 'float',
        height = 0.8,
        width = 0.8,
      },
    },
  },
  keys = {
    {
      "<C-w>",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete buffer"
    },
    {
      'lg',
      function()
        Snacks.lazygit.open()
      end,
      desc = "Open Lazygit"
    },
    {
      '<leader>t',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Open toggle terminal'
    }
  }
}
