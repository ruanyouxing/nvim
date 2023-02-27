local format = {}
function format.setup()
  -- local config_dir = vim.fn.stdpath 'config'
  -- local formatting = require('null-ls').builtins.formatting
  -- local code_action = require('null-ls').builtins.code_actions
  -- local diagnostics = require('null-ls').builtins.diagnostics
  -- local hover = require('null-ls').builtins.hover
  -- local sources = {
  --   formatting.stylua.with {
  --     extra_args = { '--config-path', vim.fn.expand(config_dir .. '/stylua.toml') },
  --   },
  --   formatting.prettier,
  --   formatting.clang_format,
  --   hover.dictionary,
  --   formatting.nixpkgs_fmt,
  --   formatting.shfmt,
  --   diagnostics.eslint.with {
  --     extra_args = { '--config', vim.fn.expand(config_dir .. '/.eslintrc.json') },
  --   },
  --   code_action.eslint.with {
  --     extra_args = { '--config', vim.fn.expand(config_dir .. '/.eslintrc.json') },
  --   },
  -- }
  -- require('null-ls').setup {
  --   sources = sources,
  --   --     on_attach = function(_, bufnr)
  --   --       vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  --   --         buffer = bufnr,
  --   --         callback = function()
  --   --           vim.lsp.buf.format()
  --   --         end,
  --   --       })
  --   --     end,
  -- }
  -- vim.api.nvim_create_user_command('Format', function()
  --   vim.lsp.buf.format()
  -- end, {})
end

return format
