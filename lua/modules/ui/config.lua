---@diagnostic disable: different-requires
local ui = {}

function ui.cursorline()
  require('nvim-cursorline').setup {
    curosrline = { enable = true, timeout = 100, number = false },
    cursorword = { enable = true, min_length = 3, hl = { underline = true } },
  }
end

function ui.dressing()
  require('dressing').setup {
    input = { relative = 'editor' },
    select = {
      backend = { 'telescope', 'fzf', 'builtin' },
    },
  }
end

function ui.highlight()
  require('local-highlight').setup {
    hlGroup = 'TSDefinitionUsage',
  }
end

function ui.minimap()
  require('codewindow').setup {
    auto_enable = false,
    exclude_filetypes = { 'NvimTree', 'UndoTree', 'Trouble', 'dashboard', 'tsplayground', 'Outline', 'spectre_panel' },
    use_lsp = true,
    use_treesitter = true,
    use_git = true,
    show_cursor = true,
  }
end

function ui.twilight()
  require('twilight').setup {
    dimming = {
      alpha = 0.25,     -- amount of dimming
      color = { 'Normal', '#ffffff' },
      inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
    },
    context = 10,       -- amount of lines we will try to show around the current line
    treesitter = true,
    expand = {
      'function',
      'method',
      'table',
      'if_statement',
    },
    exclude = {},
  }
end

function ui.modes()
  require('modes').setup {
    colors = {
      copy = '#f5c359',
      delete = '#c75c6a',
      insert = '#78ccc5',
      visual = '#9745be',
    },
    line_opacity = 0.15,
    set_cursor = true,
    set_cursorline = true,
    set_number = true,
    ignore = { 'NvimTree', 'TelescopePrompt', 'dashboard' },
  }
end

function ui.specs()
  require('specs').setup {
    show_jumps = true,
    min_jump = 10,
    popup = {
      delay_ms = 0,
      inc_ms = 10,
      blend = 10,
      width = 10,
      winhl = 'PMenu',
      fader = require('specs').pulse_fader,
      resizer = require('specs').slide_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = { nofile = true },
  }
  vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
    pattern = '*',
    callback = function()
      require('specs').show_specs()
    end,
  })
end

function ui.splits()
  require('smart-splits').setup {
    default_amount = 1,
  }
end

function ui.statuscol()
  vim.opt.foldcolumn = '1'
  vim.opt.foldlevel = 99
  vim.o.foldenable = true
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  local builtin = require 'statuscol.builtin'
  require('statuscol').setup {
    ft_ignore = { 'NvimTree', 'Trouble', 'undotree' },
    segments = {
      { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
      { text = { '%s' },             click = 'v:lua.ScSa' },
      {
        text = { builtin.lnumfunc, ' ' },
        condition = { true, builtin.not_empty },
        click = 'v:lua.ScLa',
      },
    },
  }
end

return ui
