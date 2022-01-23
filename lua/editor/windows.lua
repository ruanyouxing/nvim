vim.cmd[[packadd nvim-window]]

vim.cmd[[hi BlackOnLightYellow guifg=#000000 guibg=#f2de91]]
require('nvim-window').setup({
  chars = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
  'O','P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'},

  normal_hl = 'BlackOnLightYellow',
  hint_hl = 'Bold',

  border = 'none'
})

