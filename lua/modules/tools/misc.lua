local misc = {
  {
    'stevearc/overseer.nvim',
    config = function()
      require('overseer').setup {
        templates = { 'builtin', 'cpp_build' },
      }
    end,
    cmd = 'OverseerRun',
  }
  ,
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = { {
      '<leader>?',
      function()
        require('which-key').show {}
      end,
    } },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup { '*' }
    end,
    cmd = 'ColorizerToggle',
  },
}
return misc
