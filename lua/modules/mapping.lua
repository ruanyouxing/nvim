local mapping = {}
local map = vim.keymap.set
local function nmap(key, cmd)
  return map('n', key, cmd, { noremap = true, silent = true })
end
local function vmap(key, cmd)
  return map('v', key, string.format(':<C-u>%s<CR>', cmd), { noremap = true, silent = true })
end
local plug = function(cmd)
  return string.format('<Plug>%s', cmd)
end
function mapping.cokeline()
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
  imap('<C-i>', cmd('IconPickerInsert alt_font symbols nerd_font emoji'), { noremap = true, silent = true })
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

_G.OnFocus = 0

local function load_autocmds()
  local autocmd = vim.api.nvim_create_autocmd
  vim.api.nvim_create_augroup('galaxyline', { clear = true })
  local opts = {
    pattern = '*',
    group = 'galaxyline',
    callback = function()
      require('galaxyline').load_galaxyline()
    end,
  }
  local events = {
    'BufEnter',
    'BufReadPost',
    'BufWinEnter',
    'BufWritePost',
    'ColorScheme',
    'FileChangedShellPost',
    'FileType',
    'TermOpen',
    'VimResized',
    'WinEnter',
  }
  autocmd(events, opts)
  autocmd({ 'WinLeave' }, {
    pattern = '*',
    group = 'galaxyline',
    callback = function()
      require('galaxyline').inactive_galaxyline()
    end,
  })
end
function mapping.zenmode()
  nmap('<F11>', function()
    if OnFocus == 0 then
      OnFocus = 1
      -- vim.cmd([[autocmd! galaxyline]])
      vim.api.nvim_del_augroup_by_name('galaxyline')
      vim.o.statusline = 0
      vim.cmd([[TZAtaraxis]])
    else
      vim.cmd([[TZAtaraxis]])
      require('galaxyline').load_galaxyline()
      load_autocmds()
      OnFocus = 0
    end
  end)
end

function mapping.doc_highlight()
  for i = 1, 9 do
    vmap(('<F%s>'):format(i), ('HSHighlight %s'):format(i))
    vmap('dh', 'HSRmHighlight')
  end
end
return mapping
