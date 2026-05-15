---@diagnostic disable: different-requires
return {
  {
    'tzachar/local-highlight.nvim',
    opts = {
      hlGroup = 'TSDefinitionUsage',
    },
    event = 'VeryLazy',
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
    event = 'VeryLazy',
    opts = {
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
  } -- ,{ 'Pheon-Dev/pigeon', lazy = true }
  ,
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },
}
