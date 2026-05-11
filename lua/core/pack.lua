require('lazy').setup({
  dev = {
    path = mnw.configDir .. '/pack/mnw/opt',
    patterns = { '' },
    fallback = true,
  },

  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
    },
  },

  install = {
    missing = true,
    colorscheme = { 'catppuccin-macchiato' }
  },

  spec = {
    { import = 'modules.editor' },
    { import = 'modules.tools' },
    { import = 'modules.ui' },
    { import = 'modules.lang' },
  },
})
