plugin {
  'ziontee113/icon-picker.nvim',
  event = 'InsertEnter',
  dependencies = 'dressing.nvim',
  config = function()
    require 'icon-picker'
  end,
  cmd = 'IconPickerInsert',
}
plugin {
  'ziontee113/color-picker.nvim',
  lazy = true,
  event = 'InsertEnter',
  config = function()
    require 'color-picker'
  end,
  cmd = 'PickColorInsert',
}
