plugin {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup { default_amount = 1 }
  end,
  build = './kitty/install-kittens.bash',
}
