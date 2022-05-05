local handlers = vim.lsp.handlers
local locations = require('lsputil.locations')
local symbols = require('lsputil.symbols')
local codeAction = require('lsputil.codeAction')
if vim.fn.has('nvim-0.5.1') == 1 then
    handlers['textDocument/codeAction'] = codeAction.code_action_handler
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
        codeAction.code_action_handler(nil, actions, nil, nil, nil)
    end

    handlers['textDocument/references'] = function(_, _, result)
        locations.references_handler(nil, result, {
		bufnr = bufnr
	}, nil)
    end

    handlers['textDocument/definition'] = function(_, method, result)
        locations.definition_handler(nil, result, {
		bufnr = bufnr,
		method = method
	}, nil)
    end

    handlers['textDocument/declaration'] = function(_, method, result)
        locations.declaration_handler(nil, result, {
		bufnr = bufnr,
		method = method
	}, nil)
    end

    handlers['textDocument/typeDefinition'] = function(_, method, result)
        locations.typeDefinition_handler(nil, result, {
		bufnr = bufnr,
		method = method
	}, nil)
    end

    handlers['textDocument/implementation'] = function(_, method, result)
        locations.implementation_handler(nil, result, {
		bufnr = bufnr,
		method = method
	}, nil)
    end

    handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        symbols.document_handler(nil, result, {
		bufnr = bufn
	}, nil)
    end

    handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        symbols.workspace_handler(nil, result, {
		bufnr = bufn
	}, nil)
    end
end
