return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  init = function()
    vim.g.no_plugin_maps = true
  end,
  opts = {
    select = {
      lookahead = true,
    },
    swap = {
      set_jumps = true,
    },
    move = {
      set_jumps = true,
    },
  },
}
