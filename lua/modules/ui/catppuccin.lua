return {
  'catppuccin/nvim',
  name = 'catppuccin',
  build = ':CatppuccinCompile',
  lazy = false,
  priority = 1000,
  opts = {
    flavour = 'mocha',
    compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
    compile_check = false,

    transparent_background = false,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = false,
    },
  },
}
