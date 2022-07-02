local config = {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
local completionItem = capabilities.textDocument.completion.completionItem
	completionItem.documentationFormat = {
	    "markdown", "plaintext"
	}
	completionItem.snippetSupport = true
	completionItem.preselectSupport = true
	completionItem.insertReplaceSupport = true
	completionItem.labelDetailsSupport = true
	completionItem.deprecatedSupport = true
	completionItem.commitCharactersSupport = true
	completionItem.tagSupport = { valueSet = {1} }
completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}
capabilities.offsetEncoding = "utf-8"
function config.lsp_installer()
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings {
    ui = {
	icons = {
	    server_installed = "✓",
	    server_pending = "➜",
	    server_uninstalled = "✗"
	}
    }
}
local servers = {
  'bashls',
  'clangd',
  'cssls',
  'html',
  'pyright',
  'jdtls',
  'jsonls',
  'sumneko_lua',
  'tsserver',
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print('Installing ' .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if (server.name == "sumneko_lua") then
	opts.settings = {
	    Lua = {
		diagnostics = {globals = {"vim", "packer_plugins"}},
		workspace = {
		    library = {
			[vim.fn.expand "$VIMRUNTIME/lua"] = true,
			[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true
		    },
		    maxPreload = 100000,
		    preloadFileSize = 10000
		},
		telemetry = {enable = false}
	    }
	}
    end
    opts.capabilities = capabilities
    opts.flags = {debounce_text_changes = 500}

    server:setup(opts)
end)
end

function config.lsputils()
local handlers = vim.lsp.handlers
local symbols = require'lsputil.symbols'
local locations = require'lsputil.locations'
local code_action = require'lsputil.codeAction'
if vim.fn.has('nvim-0.5.1') == 1 then
    handlers['textDocument/codeAction'] = code_action.code_action_handler
    handlers['textDocument/references'] = locations.references_handler
    handlers['textDocument/definition'] = locations.definition_handler
    handlers['textDocument/declaration'] = locations.declaration_handler
    handlers['textDocument/typeDefinition'] = locations.typeDefinition_handler
    handlers['textDocument/implementation'] = locations.implementation_handler
    handlers['textDocument/documentSymbol'] = symbols.document_handler
    handlers['workspace/symbol'] = symbols.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    handlers['textDocument/codeAction'] = function(_, _, actions)
        code_action.code_action_handler(nil, actions, nil, nil, nil)
    end

    handlers['textDocument/references'] = function(_, _, result)
        locations.references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    handlers['textDocument/definition'] = function(_, method, result)
        locations.definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/declaration'] = function(_, method, result)
        locations.declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/typeDefinition'] = function(_, method, result)
        locations.typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/implementation'] = function(_, method, result)
        locations.implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        symbols.document_handler(nil, result, { bufnr = bufn }, nil)
    end

    handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        symbols.workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end
end
return config
