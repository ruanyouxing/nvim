config_dir = vim.fn.stdpath 'config'
return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  setup = {
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      nix = { "alejandra" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
    },
    formatters = {
      stylua = {
        prepend_args = { '--config-path', vim.fn.expand(config_dir .. '/stylua.toml') },
      },
      clang_format = {
        prepend_args = { '-style=file:' .. vim.fn.expand(config_dir .. '/.clang_format') },
      },
    },

    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true, -- Nếu conform không tìm thấy formatter, sẽ dùng LSP mặc định
    -- },
  },
  keys = { {
    mode = { "n", "v" },
    "<leader>f",
    function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end,
    { desc = "Format file or range" }
  } }
}
