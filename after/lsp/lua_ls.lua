return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', '.git' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim', 'packer_plugins' } },
      telemetry = { enable = false },
    },
  },
}
