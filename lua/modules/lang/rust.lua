return {
  'mrcjkb/rustaceanvim',
  version = '^9',
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        test_executor = 'background',
      },
      server = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        default_settings = {
          ['rust-analyzer'] = {
            check = {
              command = 'clippy',
            },
            checkOnSave = true,
            inlayHints = {
              bindingModeHints = { enable = true },
              closureCaptureHints = { enable = true },
              closureReturnTypeHints = { enable = 'always' },
              discriminantHints = { enable = 'always' },
            },
            procMacro = { enable = true },
          },
        },
      },
    }
  end,
}
