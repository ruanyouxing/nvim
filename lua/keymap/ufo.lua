local keymap = require 'core.keymap'
local nmap = keymap.nmap
local defaults = keymap.new_opts(keymap.noremap, keymap.silent)
nmap {
  {
    'K',
    function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end,
    defaults,
  },
  {
    'zR',
    function()
      require('ufo').openAllFolds()
    end,
    defaults,
  },
  {
    'zM',
    function()
      require('ufo').closeAllFolds()
    end,
  },
}
