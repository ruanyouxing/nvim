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
      yaml = { 'prettier' },
    },
    formatters = {
      stylua = {
        prepend_args = { '--config-path', mnw.configDir .. '/pack/mnw/start/nvim/stylua.toml' },
      },
      clang_format = {
        prepend_args = { '-style=file:' .. mnw.configDir .. '/pack/mnw/start/nvim/.clang_format' },
      },
    },
  },
  keys = {
    {
      mode = { 'n', 'v' },
      '<leader>f',
      function()
        require('conform').format {
          async = false,
          timeout_ms = 1000,
        }
      end,
      { desc = 'Format file or range' },
    },
  },
  event = 'BufWritePre',
}
