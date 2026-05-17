return {
  {
    'stevearc/overseer.nvim',
    opts = {
      templates = { 'builtin', 'cpp_build' },
    },
    cmd = 'OverseerRun',
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = { {
      '<leader>?',
      function()
        require('which-key').show {}
      end,
    } },
  },
  {
    'norcalli/nvim-colorizer.lua',
    opts = { '*' },
    cmd = 'ColorizerToggle',
  },
  {
    'aikhe/wrapped.nvim',
    dependencies = { 'nvzone/volt' },
    cmd = { 'WrappedNvim' },
    opts = { path = '/home/hungz/.dotfiles/nvim/' },
  },
}
