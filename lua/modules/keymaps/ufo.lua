local wk = require 'which-key'
wk.add {
  {
    '<leader>F<leader>',
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
    '<leader>Fo',
    function()
      require('ufo').openAllFolds()
    end,
    desc = 'Open all folds',
  },
  {
    '<leader>Fc',
    function()
      require('ufo').closeAllFolds()
    end,
    desc = 'Close all folds',
  },
  {
    '<leader>FK',
    function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end,
    desc = 'Hover folds',
  },
}
