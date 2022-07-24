local format = {}

function format.null_ls()
  local null_ls = require('null-ls')
  local formatting = null_ls.builtins.formatting
  local code_action = null_ls.builtins.code_actions
  local diagnostics = null_ls.builtins.diagnostics
  local hover = null_ls.builtins.hover
  local sources = {
    formatting.stylua.with({
      extra_args = { '--config-path', vim.fn.expand(vim.fn.stdpath('config') .. '/stylua.toml') },
    }),
    formatting.prettier,
    formatting.clang_format,
    hover.dictionary,
    diagnostics.eslint,
    code_action.eslint,
  }
  null_ls.setup({
    sources = sources,
  })
end

return format
