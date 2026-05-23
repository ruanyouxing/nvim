return {
  'folke/snacks.nvim',
  opts = {
    picker = {
      enabled = true,
      ui_select = true,
      border = 'rounded',
      sources = {
        files = {
          hidden = true,
          exclude = { ".git/*", "node_modules/*", "__pycache__/*" },
        },
        zoxide = {
          confirm = { "cd", "close" }
        },
      },
      layout = {
        preset = 'telescope',
        hidden = { "preview" },
        layout = {
          width  = 0.6,
          height = 0.8
        }
      },
    },
  },
  keys = {
    {
      '<C-f>',
      function()
        Snacks.picker.grep()
      end,
      desc = "Live grep"
    },
    {
      '<C-t>',
      function()
        Snacks.picker.files()
      end,
      desc = "Open files"
    },
    {
      '<leader>z',
      function()
        Snacks.picker.zoxide()
      end,
      desc = "Jump to directory"
    }
  }
}
