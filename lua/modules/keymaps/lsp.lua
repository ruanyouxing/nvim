vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local buf = vim.lsp.buf
    require('which-key').add {
      {
        '<leader>lda',
        function()
          require('trouble').toggle { mode = 'lsp_declarations' }
        end,
        desc = 'Declaration',
        mode = 'n',
      },
      {
        '<leader>lde',
        function()
          require('trouble').toggle { mode = 'lsp_definitions' }
        end,
        desc = 'Definitions',
        mode = 'n',
      },
      {
        '<leader>lds',
        function()
          require('trouble').toggle { mode = 'lsp_document_symbols' }
        end,
        desc = 'Document symbols',
        mode = 'n',
      },
      { '<leader>lK', buf.hover, desc = 'Hover', mode = 'n' },
      { '<leader>lc', buf.code_action, desc = 'Code Actions', mode = 'n' },
      {
        '<leader>lr',
        function()
          require('trouble').toggle { mode = 'lsp_references' }
        end,
        desc = 'References',
        mode = 'n',
      },
      {
        '<leader>lim',
        function()
          require('trouble').toggle { mode = 'lsp_implementations' }
        end,
        desc = 'Implementations',
        mode = 'n',
      },
      {
        '<leader>ltd',
        function()
          require('trouble').toggle { mode = 'lsp_type_definitions' }
        end,
        desc = 'Type definitions',
        mode = 'n',
      },
      {
        '<leader>lic',
        function()
          require('trouble').toggle { mode = 'lsp_incoming_calls' }
        end,
        desc = 'Incoming calls',
        mode = 'n',
      },
      {
        '<leader>loc',
        function()
          require('trouble').toggle { mode = 'lsp_outcoming_calls' }
        end,
        desc = 'Outcoming calls',
        mode = 'n',
      },
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
        desc = 'Format',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ldg',
        function()
          require('trouble').toggle { mode = 'diagnostics' }
        end,
        desc = 'Diagnostics',
      },
    }
  end,
})
