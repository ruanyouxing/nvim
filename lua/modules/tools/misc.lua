plugin {
  'stevearc/overseer.nvim',
  config = function()
    require('overseer').setup {
      templates = { 'builtin', 'cpp_build' },
    }
  end,
  cmd = 'OverseerRun',
}
plugin {
  'nvim-pack/nvim-spectre',
  config = function()
    require('spectre').setup {
      replace_vim_cmd = 'cdo',
      is_open_target_win = true,
      is_insert_mode = true,
    }
  end,
  lazy = true,
}

plugin {
  'folke/which-key.nvim',
  event = 'VeryLazy',
}
plugin {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup { '*' }
  end,
  cmd = 'ColorizerToggle',
}
plugin { 'PHSix/faster.nvim', event = 'VimEnter' }
