return {
  {
    'stevearc/overseer.nvim',
    opts = {
      templates = { 'builtin', 'cpp_build' },
    },
    cmd = 'OverseerRun',
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
    opts = { path = mnw.configDir },
  },
  { 'nvim-lua/plenary.nvim' },
}
