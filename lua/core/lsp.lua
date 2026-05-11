local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, blink = pcall(require, 'blink.cmp')

if ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
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
