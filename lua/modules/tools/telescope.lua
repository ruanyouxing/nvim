plugin {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'sharkdp/fd',                                lazy = true },
    { 'BurntSushi/ripgrep',                        lazy = true },
    { 'nvim-telescope/telescope-media-files.nvim', lazy = true },
    { 'jvgrootveld/telescope-zoxide',              lazy = true },
    { 'nvim-lua/popup.nvim',                       lazy = true },
    { 'nvim-lua/plenary.nvim',                     lazy = true },
  },
  config = function()
    local actions = require 'telescope.actions'
    require('telescope').load_extension 'zoxide'
    require('telescope').load_extension 'media_files'
    require('telescope').load_extension 'notify'
    require('telescope').load_extension 'persisted'
    require('telescope').setup {
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
}
