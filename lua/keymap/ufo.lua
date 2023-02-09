local keymap = require 'core.keymap'
local nmap = keymap.nmap
nmap {
  {
    'K',
    function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end,
  },
  {
    'zR',
    function()
      require('ufo').openAllFolds()
    end,
  },
  {
    'zM',
    function()
      require('ufo').closeAllFolds()
    end,
  },
}
