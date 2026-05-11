return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', '.git' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim', 'packer_plugins' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      telemetry = { enable = false },
    },
  },
}
