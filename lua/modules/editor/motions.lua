local jump_modes = { 'n', 'o', 'x' }
return {
  {
    'chrisgrieser/nvim-spider',
    keys = {
      {
        mode = jump_modes,
        'w',
        function()
          require('spider').motion('w')
        end
      },
      {
        mode = jump_modes,
        'e',
        function()
          require('spider').motion('e')
        end
      },
      {
        mode = jump_modes,
        'b',
        function()
          require('spider').motion('b')
        end
      },
      {
        mode = jump_modes,
        'ge',
        function()
          require('spider').motion('ge')
        end
      },
    },
  },
  {
    'smoka7/hop.nvim',
    lazy = true,
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    keys = {
      {
        mode = { 'n', 'v' },
        '<S-Space>',
        function()
          require('hop').hint_lines_skip_whitespace()
        end,
      },
      {
        mode = 'v',
        'w',
        function()
          require('hop').hint_words { direction = require('hop.hint').HintDirection.AFTER_CURSOR }
        end,
      },
      {
        mode = 'v',
        'W',
        function()
          require('hop').hint_words { direction = require('hop.hint').HintDirection.BEFORE_CURSOR }
        end,
      },
      {
        mode = { 'n', 'v' },
        'L',
        function()
          require('hop').hint_words { direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }
        end,
      },
      {
        mode = { 'n', 'v' },
        'H',
        function()
          require('hop').hint_words {
            direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          }
        end,
      },
    }
  } -- Will be replaced by flash.nvim soon I guess?
  ,
}
