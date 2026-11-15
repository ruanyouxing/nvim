return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      nix = { 'alejandra' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      json = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      markdown = { 'prettier' },
      rust = { 'rustfmt', lsp_format = 'fallback' },
      yaml = { 'prettier' },
    },
    formatters = {
      clang_format = {
        prepend_args = { '-style=file:' .. mnw.configDir .. '/.clang_format' },
      },
    },
  },
  keys = {
  },
  event = 'BufWritePre',
}
