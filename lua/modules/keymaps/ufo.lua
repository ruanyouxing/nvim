local wk = require 'which-key'
wk.add {
  {
    '<M-F><leader>',
    function()
      if vim.fn.foldclosed '.' == -1 then
        vim.cmd [[foldclose]]
      else
        vim.cmd [[foldopen]]
      end
    end,
    desc = 'Toggle fold',
  },
  {
    '<M-F>o',
    function()
      require('ufo').openAllFolds()
    end,
    desc = 'Open all folds',
  },
  {
    '<M-F>c',
    function()
      require('ufo').closeAllFolds()
    end,
    desc = 'Close all folds',
  },
  {
    '<M-F>K',
    function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end,
    desc = 'Hover folds',
  },
}
