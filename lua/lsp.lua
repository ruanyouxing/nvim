vim.cmd[[packadd aerial.nvim]]
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

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.documentationFormat = {
    "markdown", "plaintext"
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport =
    true
capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = {1}
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}


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

