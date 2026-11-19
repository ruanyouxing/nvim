vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local buf = vim.lsp.buf
    require('which-key').add {
      { '<leader>lda', buf.declaration, desc = 'LSP Declration', mode = 'n' },
      { '<leader>lde', buf.definition, desc = 'LSP Definitions', mode = 'n' },
      { '<leader>lds', buf.document_symbol, desc = 'LSP Document symbols', mode = 'n' },
      { '<leader>lK', buf.hover, desc = 'LSP Hover', mode = 'n' },
      { '<leader>lc', buf.code_action, desc = 'LSP Code Actions', mode = 'n' },
      { '<leader>lr', buf.references, desc = 'LSP References', mode = 'n' },
      { '<leader>li', buf.implementation, desc = 'LSP Implementations', mode = 'n' },
      {
        '<leader>ln',
        function()
          require('nvim-navbuddy').open()
        end,
        desc = 'Navigation',
        mode = 'n',
      },
      {
        '<leader>f',
        function()
          require('conform').format {
            async = false,
            timeout_ms = 1000,
          }
        end,
        desc = 'Format file',
        mode = { 'n', 'v' },
      },
      {
        '<leader>lf',
        function()
          require('conform').format {
            async = false,
            timeout_ms = 1000,
          }
        end,
        desc = 'Format file',
        mode = { 'n', 'v' },
      },
    }
  end,
})
