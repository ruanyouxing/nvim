require('which-key').add {
  {
    '<leader>g',
    function()
      require('which-key').show {
        keys = '<leader>G',
        loop = true,
      }
    end,
  },
  {
    '<leader>Gdo',
    function()
      vim.cmd [[DiffviewOpen]]
    end,
  },
}
