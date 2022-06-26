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
capabilities.offsetEncoding = { "utf-16" }

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
return config
