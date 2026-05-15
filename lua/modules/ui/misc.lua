---@diagnostic disable: different-requires
local misc = {
  {
    'tzachar/local-highlight.nvim',
    opts = {
      hlGroup = 'TSDefinitionUsage',
    },
    event = 'BufRead',
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {
      input = { relative = 'editor' },
      select = {
        backend = { 'telescope', 'fzf', 'builtin' },
      },
    },
  },
  {
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
  }  -- ,{ 'Pheon-Dev/pigeon', lazy = true }
,
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },
}
return misc
