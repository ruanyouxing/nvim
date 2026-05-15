-- Now use Snacks.notifier instead
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {

    cmdline = { view = 'cmdline' },
    presets = { inc_rename = true },
    lsp = { signature = { enabled = false } },
  },
}
