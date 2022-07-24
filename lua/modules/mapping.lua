local mapping = {}
local map = vim.keymap.set
local function nmap(key, cmd)
  return map('n', key, cmd, { noremap = true, silent = true })
end

function mapping.cokeline()
  local plug = function(cmd)
    return string.format('<Plug>%s', cmd)
  end
  nmap('<C-]>', plug('(cokeline-focus-next)'))
  nmap('<C-[>', plug('(cokeline-focus-prev)'))
  nmap('<Tab>', plug('(cokeline-switch-next)'))
  nmap('<S-Tab>', plug('(cokeline-switch-prev)'))
  for i = 1, 9 do
    nmap(('<F%s>'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i))
    nmap(('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i))
  end
end
function mapping.ufo()
  local ufo = require('ufo')
  nmap('K', function()
    local winid = ufo.peekFoldedLinesUnderCursor()
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

function mapping.icon_picker()
  local function cmd(str)
    return string.format('<cmd>%s<CR>', str)
  end
  local function imap(key, command, opt)
    return map('i', key, command, opt)
  end
  imap('<C-i>', cmd('PickEverythingInsert'), { noremap = true, silent = true })
end

function mapping.color_picker()
  local function cmd(str)
    return string.format('<cmd>%s<CR>', str)
  end
  local function imap(key, command, opt)
    return map('i', key, command, opt)
  end
  imap('<C-c>', cmd('PickColorInsert'), { silent = true, noremap = true })
end
return mapping
