local lsp = {}

Servers = {
  'bashls',
  'clangd',
  'lua_ls',
  'html',
  'cssls',
  'jsonls',
  'pyright',
  'tsserver',
  'rust_analyzer',
}
function lsp.lspconfig()
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
  capabilities.offsetEncoding = { 'utf-16' }
  require('mason').setup {}
  for _, name in ipairs(Servers) do
    require('lspconfig')[name].setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        if client.server_capabilities['documentSymbolProvider'] then
          require('nvim-navic').attach(client, bufnr)
        end
        require('inlay-hints').on_attach(client, bufnr)
      end,
      flags = { debounce_text_changes = 500 },
    }
  end
  require('lspconfig').lua_ls.setup {
    settings = {
      Lua = {
        hints = { enable = true },
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
  }
end

function lsp.lsputils()
  local handlr = vim.lsp.handlers
  local sym = require 'lsputil.symbols'
  local loca = require 'lsputil.locations'
  local ca = require 'lsputil.codeAction'
  if vim.fn.has 'nvim-0.5.1' == 1 then
    handlr['textDocument/codeAction'] = ca.code_action_handler
    handlr['textDocument/references'] = loca.references_handler
    handlr['textDocument/definition'] = loca.definition_handler
    handlr['textDocument/declaration'] = loca.declaration_handler
    handlr['textDocument/typeDefinition'] = loca.typeDefinition_handler
    handlr['textDocument/implementation'] = loca.implementation_handler
    handlr['textDocument/documentSymbol'] = sym.document_handler
    handlr['workspace/symbol'] = sym.workspace_handler
  else
    local bufnr = vim.api.nvim_buf_get_number(0)
    handlr['textDocument/codeAction'] = function(_, _, actions)
      ca.code_action_handler(nil, actions, nil, nil, nil)
    end

    handlr['textDocument/references'] = function(_, _, result)
      loca.references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    handlr['textDocument/definition'] = function(_, method, result)
      loca.definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlr['textDocument/declaration'] = function(_, method, result)
      loca.declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlr['textDocument/typeDefinition'] = function(_, method, result)
      loca.typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlr['textDocument/implementation'] = function(_, method, result)
      loca.implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlr['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
      sym.document_handler(nil, result, { bufnr = bufn }, nil)
    end

    handlr['textDocument/symbol'] = function(_, _, result, _, bufn)
      sym.workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
  end
end

function lsp.mason()
  local packages = {
    'prettier',
    'clang-format',
    'codelldb',
    'black',
    'stylua',
    'shellcheck',
  }
  for _, v in ipairs(Servers) do
    table.insert(packages, v)
  end
  require('mason-tool-installer').setup {
    ensure_installed = packages,
    auto_update = true,
    run_on_start = true,
    start_delay = 2000,
  }
end

function lsp.timeout()
  vim.g.lspTimeoutConfig = {
    stopTimeout = 1000 * 60 * 2,
    startTimeOut = 1000 * 5,
    silent = false,
  }
end

return lsp
