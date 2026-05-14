return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-media-files.nvim', lazy = true },
    { 'jvgrootveld/telescope-zoxide',              lazy = true },
    { 'nvim-lua/popup.nvim',                       lazy = true },
  },
  config = function()
    local actions = require 'telescope.actions'
    require('telescope').load_extension 'zoxide'
    require('telescope').load_extension 'media_files'
    require('telescope').load_extension 'notify'
    require('telescope').load_extension 'persisted'
    require('telescope').setup {
      defaults = {
        preview = {
          treesitter = false
        },
      },
      mappings = {
        i = {
          ['<esc>'] = actions.close,
        },
        n = {
          ['q'] = actions.close,
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }
  end,
  lazy = true,
  cmd = 'Telescope',
  keys = {
    {
      '<C-t>',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = 'Open files'
    },
    {
      '<leader>z',
      function()
        require('telescope').extensions.zoxide.list {}
      end,
      desc = 'Telescope: jump to path'
    },
  }
}
