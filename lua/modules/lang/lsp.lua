on_attach = function(client, bufnr)
  if client.server_capabilities['documentSymbolProvider'] then
    require('nvim-navic').attach(client, bufnr)
  end
end
plugin {
  'dundalek/lazy-lsp.nvim',
  dependencies = { 'nvim-lspconfig' },
  lazy = true,
}
plugin {
  'neovim/nvim-lspconfig',
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local completionItem = capabilities.textDocument.completion.completionItem
    completionItem.documentationFormat = {
      'markdown',
      'plaintext',
    }
    completionItem.snippetSupport = true
    completionItem.preselectSupport = true
    completionItem.insertReplaceSupport = true
    completionItem.labelDetailsSupport = true
    completionItem.deprecatedSupport = true
    completionItem.commitCharactersSupport = true
    completionItem.tagSupport = { valueSet = { 1 } }
    completionItem.resolveSupport = {
      properties = { 'documentation', 'detail', 'additionalTextEdits' },
    }
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    vim.lsp.config('*', {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = { debounce_text_changes = 500 },
    })
    vim.lsp.config('ccls', {
      on_attach = on_attach,
    })
    -- vim.lsp.config('clangd', {
    --   on_attach = function(client, bufnr)
    --     if client.server_capabilities['documentSymbolProvider'] then
    --       require('nvim-navic').attach(client, bufnr)
    --     end
    --     -- require('clangd_extensions.inlay_hints').setup_autocmd()
    --     -- require('clangd_extensions.inlay_hints').set_inlay_hints()
    --   end,
    -- })
    vim.lsp.config('qmlls', {
      command = { 'qmlls', '-E' },
      filetypes = { 'qml' },
    })
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim', 'packer_plugins' } },
          workspace = {
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
          telemetry = { enable = false },
        },
      },
    })
    require('lazy-lsp').setup {
      use_vim_lsp_config = true,
      prefer_local = true,
      excluded_servers = {
        'sqls',
        'clangd',
        'sourcekit',
        'rnix',
        'eslint',
        'rls',
        'rome',
        'nixd',
        'basedpyright',
        'pylyzer',
        'jedi_language_server',
        'ruff',
      },
      preferred_servers = {
        yaml = { 'yamlls' },
        javascript = { 'tsserver' },
        rust = { 'rust_analyzer' },
        qml = { 'qmlls' },
        python = { 'pyright' },
        cpp = { 'ccls' },
        lua = { 'lua_ls' },
      },
    }
  end,
  event = 'BufEnter',
}

plugin {
  'p00f/clangd_extensions.nvim',
  ft = { 'c', 'cpp' },
  -- config = function()
  --   local clangd = require 'clangd_extensions'
  --   clangd.setup {
  --     extensions = {
  --       autoSetHints = true,
  --       hover_with_actions = true,
  --       inlay_hints = {
  --         only_current_line = false,
  --         only_current_line_autocmd = 'CursorHold',
  --         show_parameter_hints = true,
  --         parameter_hints_prefix = '<- ',
  --         other_hints_prefix = '=> ',
  --         max_len_align = false,
  --         max_len_align_padding = 1,
  --         right_align = false,
  --         right_align_padding = 7,
  --         highlight = 'Comment',
  --         priority = 100,
  --       },
  --       ast = {
  --         role_icons = {
  --           type = '',
  --           declaration = '',
  --           expression = '',
  --           specifier = '',
  --           statement = '',
  --           ['template argument'] = '',
  --         },
  --         {
  --           Compound = '',
  --           Recovery = '',
  --           TranslationUnit = '',
  --           PackExpansion = '',
  --           TemplateTypeParm = '',
  --           TemplateTemplateParm = '',
  --           TemplateParamObject = '',
  --         },
  --         highlights = {
  --           detail = 'Comment',
  --         },
  --         memory_usage = {
  --           border = 'rounded',
  --         },
  --         symbol_info = {
  --           border = 'rounded',
  --         },
  --       },
  --     },
  --   }
  -- end,
}
