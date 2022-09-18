local keymap = require 'core.keymap'
local nmap = keymap.nmap
local defaults = keymap.new_opts(keymap.noremap, keymap.silent)
local buf = vim.lsp.buf
nmap {
  {
    '<leader>ca',
    function()
      buf.code_action()
    end,
    defaults,
  },
  {
    '<C-i>',
    function()
      buf.references()
    end,
    defaults,
  },
  {
    'R',
    function()
      buf.rename()
    end,
    defaults,
  },
}
