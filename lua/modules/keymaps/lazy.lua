require('which-key').add {
  {
    '<M-l>l',
    function()
      require('lazy').show()
    end,
    desc = 'Lazy menu',
  },
  {
    '<M-l>x',
    desc = 'Lazy: clean/uninstall',
    function()
      require('lazy').clean()
    end,
  },
  {
    '<M-l>p',
    desc = 'Lazy: profile',
    function()
      require('lazy').profile()
    end,
  },
  {
    '<M-l>s',
    desc = 'Lazy: sync',
    function()
      require('lazy').sync()
    end,
  },
  {
    '<M-l>u',
    desc = 'Lazy: update',
    function()
      require('lazy').update()
    end,
  },
}
