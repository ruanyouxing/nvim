local mapping = {}
local map = vim.keymap.set
local function nmap(key, cmd)
  return map('n', key, cmd, { noremap = true, silent = true })
end

function mapping.ufo()
  local ufo = require('ufo')
  nmap('K', function()
    local winid = ufo.peekFoldedLineUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end)
  nmap('zR', function()
    ufo.openAllFolds()
  end)
  nmap('zM', function()
    ufo.closeAllFolds()
  end)
end

return mapping
