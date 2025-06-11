local format = {}
function format.setup()
  local null_ls = require 'null-ls'
  local config_dir = vim.fn.stdpath 'config'
  local formatting = null_ls.builtins.formatting
  local code_action = null_ls.builtins.code_actions
  local diagnostics = null_ls.builtins.diagnostics
  local hover = null_ls.builtins.hover
  local sources = {
    formatting.stylua.with {
      extra_args = { '--config-path', vim.fn.expand(config_dir .. '/stylua.toml') },
    },
    formatting.prettier,
    formatting.clang_format,
    formatting.alejandra,
    -- null_ls.builtins.diagnostics.eslint_d.with {
    --   filter = function(diagnostics)
    --     return diagnostics.code ~= "prettier/prettier"
    --   end
    -- }
  }
  null_ls.setup {
    sources = sources,
    --     on_attach = function(_, bufnr)
    --       vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    --         buffer = bufnr,
    --         callback = function()
    --           vim.lsp.buf.format()
    --         end,
    --       })
    --     end,
  }
  vim.api.nvim_create_user_command('Format', function()
    vim.lsp.buf.format()
  end, {})
end

return format
