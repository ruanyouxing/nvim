vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local buf = vim.lsp.buf
    require('which-key').add {
      {
        '<leader>l',
        function()
          require('which-key').show { keys = '<leader>L', loop = true }
        end,
        desc = 'LSP Hydra',
      },
      { '<leader>Lda', buf.declaration, desc = 'LSP Declration', mode = 'n' },
      { '<leader>Lde', buf.definition, desc = 'LSP Definitions', mode = 'n' },
      { '<leader>Lds', buf.document_symbol, desc = 'LSP Document symbols', mode = 'n' },
      { '<leader>Lh', buf.hover, desc = 'LSP Hover', mode = 'n' },
      { '<leader>Lc', buf.code_action, desc = 'LSP Code Actions', mode = 'n' },
      { '<leader>Lr', buf.references, desc = 'LSP References', mode = 'n' },
      { '<leader>Li', buf.implementation, desc = 'LSP Implementations', mode = 'n' },
      {
        '<leader>f',
        function()
          require('conform').format {
            async = false,
            timeout_ms = 1000,
          }
        end,
        { desc = 'Format file or range' },
        mode = { 'n', 'v' },
      },
      {
        '<leader>Lf',
        function()
          require('conform').format {
            async = false,
            timeout_ms = 1000,
          }
        end,
        { desc = 'Format file or range' },
        mode = { 'n', 'v' },
      },
    }
  end,
})
