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
    missing = false,
  },

  spec = {
    { import = 'modules' },
  },
})
