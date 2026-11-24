require('which-key').add {
  {
    '<M-l><leader>',
    function()
      require('lazy').show()
    end,
    desc = 'Lazy menu',
  },
  {
    '<M-l>x',
    desc = 'Clean/uninstall',
    function()
      require('lazy').clean()
    end,
  },
  {
    '<M-l>p',
    desc = 'Profile',
    function()
      require('lazy').profile()
    end,
  },
  {
    '<M-l>s',
    desc = 'Sync',
    function()
      require('lazy').sync()
    end,
  },
  {
    '<M-l>u',
    desc = 'Update',
    function()
      require('lazy').update()
    end,
  },
}
