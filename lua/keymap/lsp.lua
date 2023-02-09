local keymap = require 'core.keymap'
local nmap = keymap.nmap
local buf = vim.lsp.buf
nmap {
  {
    '<leader>ca',
    function()
      buf.code_action()
    end,
  },
  {
    '<C-i>',
    function()
      buf.references()
    end,
  },
  {
    'R',
    function()
      buf.rename()
    end,
  },
}
