local plugin = require('core.pack').package
plugin {
  'gelguy/wilder.nvim',
  event = 'CmdlineEnter',
  lazy = true,
  dependencies = {
    'romgrk/fzy-lua-native',
  },
  config = function()
    local wilder = require 'wilder'
    wilder.set_option('use_python_remote_plugin', 0)
    wilder.setup { modes = { ':', '/', '?' } }
    local gradient = {
      '#f4468f',
      '#fd4a85',
      '#ff507a',
      '#ff566f',
      '#ff5e63',
      '#ff6658',
      '#ff704e',
      '#ff7a45',
      '#ff843d',
      '#ff9036',
      '#f89b31',
      '#efa72f',
      '#e6b32e',
      '#dcbe30',
      '#d2c934',
      '#c8d43a',
      '#bfde43',
      '#b6e84e',
      '#aff05b',
    }
    for i, fg in ipairs(gradient) do
      gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = fg } })
    end
    wilder.set_option('pipeline', {
      wilder.branch(
        wilder.cmdline_pipeline {
          fuzzy = 1,
          use_python = 0,
        },
        wilder.vim_search_pipeline(),
        {
          {
            wilder.check(function(_, x)
              return x == ''
            end),
            wilder.history(),
            wilder.result {
              draw = {
                function(_, x)
                  return ' ' .. ' ' .. x
                end,
              },
            },
          },
        }
      ),
    })
    local highlighters = {
      wilder.highlighter_with_gradient {
        wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
      },
      wilder.basic_highlighter(),
    }
    wilder.set_option(
      'renderer',
      wilder.renderer_mux {
        [':'] = wilder.popupmenu_renderer {
          highlights = { gradient = gradient },
          min_height = '5%',
          max_height = '35%',
          highlighter = highlighters,
        },
        ['/'] = wilder.wildmenu_renderer {
          highlighter = highlighters,
        },
      }
    )
  end,
}
