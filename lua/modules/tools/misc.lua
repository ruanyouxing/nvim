local misc = { {
  'stevearc/overseer.nvim',
  config = function()
    require('overseer').setup {
      templates = { 'builtin', 'cpp_build' },
    }
  end,
  cmd = 'OverseerRun',
}

, {
  'folke/which-key.nvim',
  event = 'VeryLazy',
}
, {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup { '*' }
  end,
  cmd = 'ColorizerToggle',
}
, { 'PHSix/faster.nvim', event = 'VimEnter' }
}
return misc
