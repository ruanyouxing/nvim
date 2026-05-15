return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  event = 'BufRead',
  init = function()
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true,
      },
      swap = {
        set_jumps = true,
      },
      move = {
        set_jumps = true,
      },
    }
  end,
  keys = {

    {
      mode = { 'n', 'x', 'o' },
      ';',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move_next()
      end,
    },
    {
      mode = { 'n', 'x', 'o' },
      ',',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move_previous()
      end,
    },
    {
      mode = { 'n', 'x', 'o' },
      'f',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').builtin_f_expr()
      end,
      expr = true,
    },
    {
      mode = { 'n', 'x', 'o' },
      'F',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').builtin_F_expr()
      end,
      expr = true,
    },
    {
      mode = { 'n', 'x', 'o' },
      't',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').builtin_t_expr()
      end,
      expr = true,
    },
    {
      mode = { 'n', 'x', 'o' },
      'T',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').builtin_T_expr()
      end,
      expr = true,
    },

    {
      'af',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
      end,
      mode = { 'x', 'n' },
    },
    {
      'if',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
      end,
      mode = { 'x', 'o' },
    },
    {
      'ac',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
      end,
      mode = { 'x', 'o' },
    },
    {
      'ic',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
      end,
      mode = { 'x', 'o' },
    },

    {
      '<leader>a',
      function()
        require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
      end,
      mode = 'n',
    },
    {
      '<leader>A',
      function()
        require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.inner'
      end,
      mode = 'n',
    },

    {
      ']m',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
    },
    {
      ']]',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
    },
    {
      ']M',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
    },
    {
      '][',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
    },
    {
      mode = { 'n', 'x', 'o' },
      '[m',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
      end,
    },
    {
      mode = { 'n', 'x', 'o' },
      '[[',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
      end,
    },
    {
      mode = { 'n', 'x', 'o' },
      '[M',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
      end,
    },
    {
      mode = { 'n', 'x', 'o' },
      '[]',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
      end,
    },
  },
}
