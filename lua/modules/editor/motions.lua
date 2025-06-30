local jump_modes = { 'n', 'o', 'x' }
plugin {
  'chrisgrieser/nvim-spider',
  keys = {
    { mode = jump_modes, 'w',  "<cmd>lua require('spider').motion('w')<CR>" },
    { mode = jump_modes, 'e',  "<cmd>lua require('spider').motion('e')<CR>" },
    { mode = jump_modes, 'b',  "<cmd>lua require('spider').motion('b')<CR>" },
    { mode = jump_modes, 'ge', "<cmd>lua require('spider').motion('ge')<CR>" },
  },
}
plugin {
  'phaazon/hop.nvim',
  branch = 'v2',
  event = 'BufEnter',
  config = function()
    require('hop').setup {
      keys = 'etovxqpdygfblzhckisuran',
    }
  end,
}
plugin {
  'gbprod/stay-in-place.nvim',
  config = function()
    require('stay-in-place').setup {
      set_keymaps = true,
      preserve_visual_selection = true,
    }
  end,
}
