local jump_modes = { 'n', 'o', 'x' }
local motions = {
  {
    'chrisgrieser/nvim-spider',
    keys = {
      { mode = jump_modes, 'w', "<cmd>lua require('spider').motion('w')<CR>" },
      { mode = jump_modes, 'e', "<cmd>lua require('spider').motion('e')<CR>" },
      { mode = jump_modes, 'b', "<cmd>lua require('spider').motion('b')<CR>" },
      { mode = jump_modes, 'ge', "<cmd>lua require('spider').motion('ge')<CR>" },
    },
  },
  {
    'smoka7/hop.nvim',
    lazy = true,
    config = function()
      require('hop').setup {
        keys = 'etovxqpdygfblzhckisuran',
      }
    end,
  }  -- Will be replaced by flash.nvim soon I guess?
,
  {
    'gbprod/stay-in-place.nvim',
    config = function()
      require('stay-in-place').setup {
        set_keymaps = true,
        preserve_visual_selection = true,
      }
    end,
  },
}
return motions
