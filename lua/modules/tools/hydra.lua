plugin {
  'anuvyklack/hydra.nvim',
  dependencies = 'anuvyklack/keymap-layer.nvim',
  config = function()
    local Hydra = require 'hydra'

    local hint_config = {
      position = 'middle',
      border = 'rounded',
    }
    local lsp_hints = [[

  LSP:

     _ca_: Code actions      _K_: Hover               _r_: References          _f_: Format                ^

     _R_: Rename             _d_: Go to definition    _s_: Document symbols    _i_: Implementations       ^

  ]]
    Hydra {
      name = 'LSP actions',
      hint = lsp_hints,
      config = {
        color = 'blue',
        invoke_on_body = true,
        hint = hint_config,
      },
      mode = { 'n', 'x', 'v', 'o' },
      body = '<Leader>l',
      heads = {
        {
          'i',
          function()
            vim.lsp.buf.implementation()
          end,
        },
        {
          's',
          function()
            vim.lsp.buf.document_symbol()
          end,
        },
        {
          'd',
          function()
            vim.lsp.buf.definition { reuse_win = true }
          end,
          { exit = true },
        },
        {
          'R',
          function()
            vim.lsp.buf.rename()
          end,
        },
        {
          'ca',
          function()
            vim.lsp.buf.code_action()
          end,
        },
        {
          'K',
          function()
            vim.lsp.buf.hover()
          end,
        },
        {
          'r',
          function()
            vim.lsp.buf.references()
          end,
        },
        {
          'f',
          function()
            vim.lsp.buf.format()
          end,
        },
      },
    }
  end,
  keys = '<leader>l',
}
