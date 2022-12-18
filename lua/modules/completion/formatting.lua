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
    hover.dictionary,
    diagnostics.eslint.with {
      extra_args = { '--config', vim.fn.expand(config_dir .. '/.eslintrc.json') },
    },
    code_action.eslint.with {
      extra_args = { '--config', vim.fn.expand(config_dir .. '/.eslintrc.json') },
    },
  }
  null_ls.setup {
    on_init = function(new_client, _)
      new_client.offset_encoding = 'utf-8'
    end,
    sources = sources,
  }
end

return format
