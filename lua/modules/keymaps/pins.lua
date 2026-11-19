require('which-key').add {
  {
    text = 'Hbac: Close unpinned tabs',
    action = function()
      require('hbac').close_unpinned()
    end,
  },
  {
    text = 'Hbac: Pin this tab',
    action = function()
      require('hbac').toggle_pin()
    end,
  },
  {
    text = 'Hbac: Toggle autoclose',
    action = function()
      require('hbac').toggle_autoclose()
    end,
  },
}
