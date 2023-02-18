local config = {}
---@diagnostic disable: undefined-field

function config.setup()
  vim.opt.laststatus = 3
  local windline = require 'windline'
  local state = _G.WindLine.state
  local git_comps = require 'windline.components.git'
  local lsp_comps = require 'windline.components.lsp'
  local b_components = require 'windline.components.basic'
  local StatuslineComps = {}
  local addComponent = function(components)
    table.insert(StatuslineComps, components)
  end
  local divider = { b_components.divider, '' }
  local divideComps = function()
    addComponent(divider)
  end
  local utils = require 'windline.utils'
  utils.change_mode_name {
    ['n'] = { 'Norm' },
    ['nov'] = { 'Visl' },
    ['noV'] = { 'Visl' },
    ['no'] = { 'Visl' },
    ['niI'] = { 'Norm' },
    ['niR'] = { 'Norm' },
    ['niV'] = { 'Norm' },
    ['v'] = { 'Visl' },
    ['V'] = { 'VLine' },
    ['s'] = { 'Visl' },
    [''] = { 'VBlck' },
    ['S'] = { 'Visl' },
    [''] = { 'Visl' },
    ['i'] = { 'Ins' },
    ['ic'] = { 'Ins' },
    ['ix'] = { 'Ins' },
    ['R'] = { 'Rplc' },
    ['Rc'] = { 'Rplc' },
    ['Rv'] = { 'Rplc' },
    ['Rx'] = { 'Norm' },
    ['c'] = { 'Com' },
    ['cv'] = { 'Com' },
    ['ce'] = { 'Com' },
    ['r'] = { 'Rplc' },
    ['rm'] = { 'Norm' },
    ['r?'] = { 'Norm' },
    ['!'] = { 'Shell' },
    ['t'] = { 'Com' },
  }

  addComponent {
    name = 'Modes',
    hl_colors = {
      Norm = { 'green', 'bg', 'bold' },
      Border = { 'bg', 'nocolor', 'bold' },
      Ins = { 'yellow', 'bg', 'bold' },
      Visl = { 'purple', 'bg', 'bold' },
      VBlck = { 'purple', 'bg', 'bold' },
      VLine = { 'purple', 'bg', 'bold' },
      Rplc = { 'red', 'bg', 'bold' },
      Com = { 'blue', 'bg', 'bold' },
      Shell = { 'blue', 'bg', 'bold' },
    },
    text = function()
      return {
        { '',                'Border' },
        { state.mode[1] .. ' ', state.mode[1] },
      }
    end,
  }
  addComponent {
    name = 'GitBranch',
    hl_colors = {
      GitBranchHl = { 'orange', 'bg', 'bold' },
    },
    text = function(bufnr)
      if git_comps.is_git(bufnr) then
        return {
          { git_comps.git_branch { icon = ' ' }, 'GitBranchHl', 90 },
        }
      end
    end,
  }
  addComponent {
    name = 'LspName',
    hl_colors = {
      LspHl = { 'red', 'bg', 'bold' },
      Blank = { 'bg', 'nocolor' },
    },
    text = function(bufnr)
      if lsp_comps.check_lsp(bufnr) then
        return {
          { ' ',                                  'Blank' },
          { lsp_comps.lsp_name { icon = ' ' }, 'LspHl' },
        }
      end
    end,
  }
  addComponent {
    name = 'LazyUpdates',
    hl_colors = {
      TextHl = { 'orange_alt', 'bg' },
    },
    text = function()
      local lazy_status = require 'lazy.status'
      if lazy_status.has_updates() then
        return { { '  ' }, { lazy_status.updates(), 'TextHl' } }
      else
        return { { '  ' .. 0, 'TextHl' } }
      end
    end,
  }
  divideComps() -- End left side components
  addComponent {
    name = 'Hydra',
    hl_colors = {
      HydraHl = { 'blue', 'bg', 'bold' },
    },
    text = function()
      local hydrStatusline = require 'hydra.statusline'
      if hydrStatusline.is_active() then
        return {
          {
            '(' .. hydrStatusline.get_color() .. ') ' .. hydrStatusline.get_name() .. '  ',
            'HydraHl',
          },
        }
      end
    end,
  }
  addComponent {
    name = 'FileName',
    hl_colors = {
      FileNameHL = { 'green', 'bg', 'bold' },
    },
    text = function()
      return {
        { b_components.cache_file_icon { default = '' },    'FileNameHL' },
        { ' ' },
        { b_components.cache_file_name('[No Name]', 'unique'), 'FileNameHL' },
      }
    end,
  }
  divideComps() -- End center components
  addComponent {
    name = 'FileSize',
    hl_colors = {
      FSizeHl = { 'blue', 'bg', 'bold' },
    },
    text = function()
      return {
        { '  ',                        'FSizeHl' },
        { b_components.cache_file_size(), 'FSizeHl' },
        { '  ' },
      }
    end,
  }
  addComponent {
    name = 'Wpm',
    hl_colors = {
      WpmHl = { 'teal', 'bg' },
    },
    text = function()
      return {
        { require('wpm').wpm, 'WpmHl' },
        { ' | ',              'WpmHl' },
        {
          require('wpm').historic_graph(),
          'WpmHl',
        },
      }
    end,
  }
  addComponent {
    name = 'GitStatus',
    hl_colors = {
      DiffAdd = { 'green', 'bg' },
      DiffMod = { 'purple', 'bg' },
      DiffRemove = { 'orange', 'bg' },
    },
    text = function(bufnr)
      if git_comps.is_git(bufnr) then
        return {
          { ' ' },
          { git_comps.diff_added { format = '  %s ' },   'DiffAdd' },
          { git_comps.diff_changed { format = ' 柳%s ' },  'DiffMod' },
          { git_comps.diff_removed { format = '  %s ' }, 'DiffRemove' },
        }
      end
    end,
  }
  addComponent {
    name = 'LineColProgress',
    hl_colors = {
      LineColHL = { 'orange', 'bg' },
      ProgressHL = { 'blue', 'bg' },
      Border = { 'bg', 'nocolor' },
    },
    text = function()
      return {
        {
          b_components.line_col,
          'LineColHL',
        },
        {
          b_components.progress,
          'ProgressHL',
        },
        { '', 'Border' },
      }
    end,
  }
  local default = {
    filetypes = { 'default' },
    active = StatuslineComps,
    inactive = {}
  }
  windline.setup {
    colors_name = function(colors)
      local colorsFg, colorsBg = require('windline.themes').get_hl_color 'StatusLine'
      colors.teal = '#5e9db2'
      colors.fg = colorsFg
      colors.bg = colorsBg
      colors.red = '#ec5767'
      colors.yellow = '#ecbe7b'
      colors.blue = '#51afef'
      colors.orange = '#ff8800'
      colors.orange_alt = '#ff9e64'
      colors.green = '#98be65'
      colors.purple = '#a020f0'
      colors.nocolor = 'NONE'
      return colors
    end,
    statuslines = { default },
  }
end

return config
