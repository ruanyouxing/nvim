---@diagnostic disable: different-requires
local plugin = require('core.pack').package
local config_list = { 'themes', 'lsp_ui', 'notification', 'wilder', 'cokeline', 'windline', 'blankline', 'dashboard', 'ufo', 'cursor' }
for _, v in ipairs(config_list) do
  require('modules.ui.' .. v)
end
plugin {
  'tzachar/local-highlight.nvim',
  config = function()
    require('local-highlight').setup {
      hlGroup = 'TSDefinitionUsage',
    }
  end,
  event = 'BufRead',
  dependencies = 'folke/snacks.nvim',
}
plugin {
  'typicode/bg.nvim',
}
plugin {
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
plugin {
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
plugin {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()
  end,
  cmd = 'NvimTreeToggle',
}
plugin {
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
plugin {
  'lukas-reineke/virt-column.nvim',
  event = 'UIEnter',
  config = function()
    require('virt-column').setup()
  end,
}
plugin {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup { default_amount = 1 }
  end,
  build = './kitty/install-kittens.bash',
}
plugin {
  'luukvbaal/statuscol.nvim',
  config = function()
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
  end,
  event = 'BufWinEnter',
}
-- plugin { 'Pheon-Dev/pigeon', lazy = true }
