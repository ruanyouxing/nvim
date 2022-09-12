local ui = {}
function ui.alpha()
  local alpha = require 'alpha'
  local dashboard = require 'alpha.themes.dashboard'
  dashboard.section.header.val = {
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠟⠉⠉⠉⠉⠉⠉⠉⠙⠻⢶⣄⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⡀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡟⠀⣠⣶⠛⠛⠛⠛⠛⠛⠳⣦⡀⠀⠘⣿⡄⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠁⠀⢹⣿⣦⣀⣀⣀⣀⣀⣠⣼⡇⠀⠀⠸⣷⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠉⠛⠿⠿⠿⠿⠛⠋⠁⠀⠀⠀⠀⣿⡄ ]],
    [[⠀⠀      ⢠⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡇⠀]],
    [[      ⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
    [[⠀⠀⠀⠀⠀⠀⢰⣿⠀⠀⠀⠀⣠⡶⠶⠿⠿⠿⠿⢷⣦⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
    [[⠀    ⠀⣸⡇⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⣿⠀]],
    [[⣠⡿⠛⠛⠛⠛⠻⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⣿⠇⠀⠀⠀⠀⠀⠀⣿⠀]],
    [[ ⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡟⠀⠀⢀⣤⣤⣴⣿⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
    [[  ⢷⣶⣦⣤⣤⣤⣴⣶⣾⠿⠛⠁⢀⣶⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀]],
    [[          ⠀⠀⠀⠀⠈⣿⣆⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⡾⠃⠀]],
    [[          ⠀⠀⠀⠀⠀⠈⠛⠻⢿⣿⣾⣿⡿⠿⠟⠋⠁⠀⠀⠀]],
    [[                              ]],
  }

  dashboard.section.buttons.val = {
    dashboard.button('t', ' > Terminal', ':ToggleTerm<CR>'),
    dashboard.button('f', '  > Find file', ':Telescope find_files<CR>'),
    dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
    dashboard.button('q', '  > Quit', ':qa<CR>'),
  }

  local function footer()
    package.path = vim.fn.stdpath 'config' .. '/plugin/?.lua;' .. package.path
    local plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date ' %d-%m-%Y   %H:%M:%S'
    local version = vim.version()
    return '  '
      .. plugins
      .. ' plugins  '
      .. datetime
      .. '   '
      .. '   v'
      .. version.major
      .. '.'
      .. version.minor
      .. '.'
      .. version.patch
      .. ' \n\t\t\t kill me pls'
  end

  dashboard.section.footer.val = footer()
  alpha.setup(dashboard.opts)
end

function ui.blankline()
  vim.opt.termguicolors = true
  vim.opt.list = true
  require('indent_blankline').setup {
    char = '│',
    show_first_indent_level = true,
    filetype_exclude = {
      'startify',
      'alpha',
      'log',
      'fugitive',
      'gitcommit',
      'packer',
      'vimwiki',
      'markdown',
      'json',
      'txt',
      'vista',
      'help',
      'todoist',
      'NvimTree',
      'peekaboo',
      'git',
      'TelescopePrompt',
      'undotree',
      'flutterToolsOutline',
      '', -- for all buffers without a file type
    },
    buftype_exclude = { 'terminal', 'nofile' },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    context_patterns = {
      'class',
      'function',
      'method',
      'block',
      'list_literal',
      'selector',
      '^if',
      '^table',
      'if_statement',
      'while',
      'for',
      'type',
      'var',
      'import',
    },
    space_char_blankline = ' ',
  }
  vim.api.nvim_create_autocmd({ 'CursorMoved' }, { pattern = '*', command = 'IndentBlanklineRefresh' })
end

function ui.cokeline()
  local get_hex = require('cokeline.utils').get_hex
  local mappings = require 'cokeline/mappings'
  local errors_fg = get_hex('DiagnosticError', 'fg')
  local warnings_fg = get_hex('DiagnosticWarn', 'fg')
  local hints_fg = get_hex('Diagnostichint', 'fg')
  local red = vim.g.terminal_color_1
  local green = vim.g.terminal_color_2
  local yellow = vim.g.terminal_color_3
  local is_picking_focus = mappings.is_picking_focus
  local is_picking_close = mappings.is_picking_close
  local normal_fg = get_hex('Normal', 'fg')
  local normal_bg = get_hex('Normal', 'bg')
  local comment_fg = get_hex('Comment', 'fg')
  local column_bg = get_hex('ColorColumn', 'bg')
  require('cokeline').setup {
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and normal_fg or comment_fg
      end,
      bg = column_bg,
    },
    components = {
      {
        text = '',
        bg = normal_bg,
        fg = column_bg,
      },
      {
        text = ' ',
      },
      {
        text = function(buffer)
          return buffer.index .. '. '
        end,
      },
      {
        text = function(buffer)
          return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. ' ' or buffer.devicon.icon
        end,
        fg = function(buffer)
          return (is_picking_focus() and yellow) or (is_picking_close() and red) or buffer.devicon.color
        end,
        style = function(_)
          return (is_picking_focus() or is_picking_close()) and 'italic,bold' or nil
        end,
      },
      {
        text = function(buffer)
          return buffer.unique_prefix
        end,
        fg = comment_fg,
        style = 'italic',
        truncation = {
          priority = 3,
          direction = 'left',
        },
      },
      {
        text = function(buffer)
          return buffer.filename .. ' '
        end,
        fg = function(buffer)
          if buffer.is_modified then
            return yellow
          end
          if buffer.diagnostics.errors ~= 0 then
            return red
          end
        end,
        style = function(buffer)
          return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and 'bold,underline')
            or buffer.is_modified and 'italic,bold'
            or buffer.is_focused and 'bold'
            or buffer.diagnostics.errors ~= 0 and 'underline'
            or nil
        end,
      },
      {
        text = function(buffer)
          return (buffer.diagnostics.errors ~= 0 and ' ' .. buffer.diagnostics.errors .. ' ')
            or (buffer.diagnostics.warnings ~= 0 and ' ' .. buffer.diagnostics.warnings .. ' ')
            or ''
        end,
        fg = function(buffer)
          return (buffer.diagnostics.errors ~= 0 and errors_fg)
            or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
            or nil
        end,
      },
      {
        text = function(buffer)
          return (buffer.diagnostics.hints ~= 0 and ' ' .. buffer.diagnostics.hints .. ' ') or ''
        end,
        fg = function(buffer)
          return (buffer.diagnostics.hints ~= 0 and hints_fg) or nil
        end,
      },
      {
        text = function(buffer)
          return buffer.is_modified and '● ' or ' '
        end,
        fg = function(buffer)
          return buffer.is_modified and green or nil
        end,
        delete_buffer_on_left_click = true,
      },
      {
        text = '|',
        fg = function(buffer)
          return buffer.is_focused and green or nil
        end,
      },
      {
        text = '',
        fg = column_bg,
        bg = normal_bg,
      },
    },
    sidebar = {
      filetype = 'NvimTree',
      components = {
        {
          text = '  Explorer',
          fg = yellow,
          bg = get_hex('NvimTreeNormal', 'bg'),
          style = 'bold',
        },
      },
    },
  }
end

function ui.cursorline()
  require('nvim-cursorline').setup {
    curosrline = { enable = true, timeout = 100, number = false },
    cursorword = { enable = true, min_length = 3, hl = { underline = true } },
  }
end
function ui.dap()
  require('dapui').setup()
end
function ui.fidget()
  require('fidget').setup()
end

function ui.fold()
  vim.wo.foldlevel = 99
  vim.wo.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:⏵]]
  vim.o.foldcolumn = '1'
  vim.o.foldlevelstart = -1

  require('ufo').setup {
    provider_selector = function()
      return { 'treesitter' }
    end,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end,
    require('modules.mapping').ufo(),
  }
end

function ui.lightbulb()
  require('nvim-lightbulb').setup {
    autocmd = {
      enabled = true,
    },
    sign = {
      enabled = true,
      priority = 10,
    },
    float = {
      enabled = false,
      text = '',
      win_opts = {},
    },
    virtual_text = {
      enabled = false,
      text = '💡',
      hl_mode = 'replace',
    },
    status_text = {
      enabled = false,
      text = '💡',
      text_unavailable = '',
    },
  }
end

function ui.navic()
  require('nvim-navic').setup {
    icons = {
      File = ' ',
      Module = ' ',
      Namespace = ' ',
      Package = ' ',
      Class = ' ',
      Method = ' ',
      Property = ' ',
      Field = ' ',
      Constructor = ' ',
      Enum = '練',
      Interface = '練',
      Function = ' ',
      Variable = ' ',
      Constant = ' ',
      String = ' ',
      Number = ' ',
      Boolean = '◩ ',
      Array = ' ',
      Object = ' ',
      Key = ' ',
      Null = 'ﳠ ',
      EnumMember = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' ',
    },
    highlight = false,
    separator = ' > ',
    depth_limit = 2,
    depth_limit_indicator = '..',
  }
  vim.api.nvim_set_hl(0, 'NavicIconsFile', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsModule', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsNamespace', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsPackage', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsClass', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsMethod', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsProperty', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsField', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsConstructor', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsEnum', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsInterface', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsFunction', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsVariable', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsConstant', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsString', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsNumber', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsBoolean', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsArray', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsObject', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsKey', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsNull', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsEnumMember', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsStruct', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsEvent', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsOperator', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicIconsTypeParameter', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicText', { default = true, bg = '#000000', fg = '#ffffff' })
  vim.api.nvim_set_hl(0, 'NavicSeparator', { default = true, bg = '#000000', fg = '#ffffff' })
end

function ui.notify()
  vim.notify = require 'notify'
  require('notify').setup {
    stages = 'slide',
    on_open = nil,
    on_close = nil,
    render = 'default',
    timeout = 500,
    background_colour = '#ffffff',
    minimum_width = 50,
    icons = {
      ERROR = '',
      WARN = '',
      INFO = '',
      DEBUG = '',
      TRACE = '✎',
    },
  }
  require 'notify' 'Welcome!'
end

function ui.rose_pine() end

function ui.tokyonight()
  vim.g.tokyonight_style = 'night'
  vim.g.tokyonight_hide_inactive_statusline = 1
  vim.g.tokyonight_italic_funtions = 1
  vim.g.tokyonight_italic_variables = 1
  vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
end

function ui.transparent()
  require('transparent').setup {
    enable = false,
    extra_groups = 'all',
  }
end

function ui.twilight()
  require('twilight').setup {
    dimming = {
      alpha = 0.25, -- amount of dimming
      color = { 'Normal', '#ffffff' },
      inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
    },
    context = 10, -- amount of lines we will try to show around the current line
    treesitter = true,
    expand = {
      'function',
      'method',
      'table',
      'if_statement',
    },
    exclude = {},
  }
  vim.cmd [[TwilightEnable]]
end

function ui.wilder()
  local wilder = require 'wilder'
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
      },
      wilder.python_file_finder_pipeline {
        file_command = { 'fd', '-tf' },
        dir_command = { 'fd', '-tf' },
        filters = { 'fuzzy_filter', 'difflib_sorter' },
      },

      wilder.python_search_pipeline()
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
end
return ui
