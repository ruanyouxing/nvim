---@diagnostic disable: different-requires
local misc = { {
  'tzachar/local-highlight.nvim',
  config = function()
    require('local-highlight').setup {
      hlGroup = 'TSDefinitionUsage',
    }
  end,
  event = 'BufRead',
  dependencies = 'folke/snacks.nvim',
}
, {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = { relative = 'editor' },
      select = {
        backend = { 'telescope', 'fzf', 'builtin' },
      },
    }
  end,
}
, {
  'mvllow/modes.nvim',
  event = 'UIEnter',
  config = function()
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
  end,
}
, {
  'folke/twilight.nvim',
  event = 'CursorMoved',
  config = function()
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
  end,
}
-- ,{ 'Pheon-Dev/pigeon', lazy = true }
, { 'mbbill/undotree', event = 'TextChanged' }
}
return misc
