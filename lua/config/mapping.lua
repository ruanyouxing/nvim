local mapping = {}
local map = vim.keymap.set
local opts = {
  silent = true,
  noremap = true,
}
local function ctrl(key)
  return string.format('<C-%s>', key)
end

local function alt(key)
  return string.format('<A-%s>', key)
end

local function leader(key)
  return string.format('<leader>%s', key)
end

function mapping.shortcuts()
  local function plug(cmd)
    return string.format('<Plug>%s', cmd)
  end

  local function nmap(key, cmd)
    return map('n', key, cmd, opts)
  end

  nmap('j', plug('(accelerated_jk_j)'))
  nmap('k', plug('(accelerated_jk_k)'))
  nmap('<Space>', '<NOP>')
  vim.g.mapleader = ' '
  nmap('D', 'd$')
  nmap('B', '0')
  nmap('<C-a>', 'ggVG')
end

function mapping.commands()
  local function nmap(key, cmd)
    return map('n', key, string.format(':%s<CR>', cmd), opts)
  end

  nmap('T', 'TroubleToggle')
  nmap('U', 'UndotreeShow')
  nmap('R', 'Lspsaga rename')
  nmap(ctrl(string.sub(alt('p'), 4, -2)), 'Telescope')
  nmap(ctrl('n'), 'NvimTreeToggle')
  nmap(ctrl('s'), 'SymbolsOutline')
  nmap(leader('p'), 'PackerSync')
  nmap(ctrl('q'), 'q!')
  nmap(ctrl('t'), 'Telescope find_files')
  nmap(ctrl('y'), 'redo')
  nmap(ctrl('z'), 'u')
  nmap(ctrl('['), 'BufferLineCyclePrev')
  nmap(ctrl(']'), 'BufferLineCycleNext')
  nmap(leader('t'), 'ToggleTerm')
  nmap(leader('<leader>'), 'Telescope frecency')
  nmap(leader('z'), 'Telescope zoxide list')
end

function mapping.func()
  local function nmap(key, func)
    return map('n', key, func)
  end

  nmap('lg', function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      float_opts = {
        border = 'double',
      },
    })
    lazygit:toggle()
  end)
  local buf = vim.lsp.buf
  nmap(leader('ca'), function()
    buf.code_action()
  end)
  nmap(leader('h'), function()
    buf.hover()
  end)
  nmap(ctrl('i'), function()
    buf.references()
  end)
  nmap('R', function()
    buf.rename()
  end)
end

return mapping
