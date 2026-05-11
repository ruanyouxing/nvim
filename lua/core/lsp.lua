local capabilities = vim.lsp.protocol.make_client_capabilities()
local completionItem = capabilities.textDocument.completion.completionItem
completionItem.documentationFormat = { 'markdown', 'plaintext' }
completionItem.snippetSupport = true
completionItem.preselectSupport = true
completionItem.insertReplaceSupport = true
completionItem.labelDetailsSupport = true
completionItem.deprecatedSupport = true
completionItem.commitCharactersSupport = true
completionItem.tagSupport = { valueSet = { 1 } }
completionItem.resolveSupport = { properties = { 'documentation', 'detail', 'additionalTextEdits' } }

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local function on_attach(client, bufnr)
  if client.server_capabilities['documentSymbolProvider'] then
    local navic_ok, navic = pcall(require, 'nvim-navic')
    if navic_ok then
      navic.attach(client, bufnr)
    end
  end
end

vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = { debounce_text_changes = 500 },
})

local files = vim.api.nvim_get_runtime_file('after/lsp/*.lua', true)
for _, file in ipairs(files) do
  local server_name = vim.fn.fnamemodify(file, ':t:r')
  vim.lsp.enable(server_name)
end
