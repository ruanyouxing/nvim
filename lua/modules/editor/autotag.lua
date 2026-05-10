return {
  'windwp/nvim-ts-autotag',
  event = 'BufRead',
  filetype = { 'html', 'javascript', 'jsx' },
  config = function()
    require('nvim-ts-autotag').setup {}
  end
}
