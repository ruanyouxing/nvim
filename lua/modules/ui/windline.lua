local config = {}
---@diagnostic disable: undefined-field
---@diagnostic disable: unused-local
SessionStatus = {}
function config.setup()
  local windline = require 'windline'
  -- Uncomment these to use cava statusbar 

  -- local create_cava_colors = function(colors)
  --   local HSL = require 'wlanimation.utils'
  --   local d_colors = {
  --     'green_light',
  --     'blue',
  --     'yellow_light',
  --     'magenta_light',
  --     'red',
  --   }
  --   local cava_colors = HSL.rgb_to_hsl(colors[d_colors[math.random(#d_colors)]]):shades(10, 8)
  --   for i = 1, 8, 1 do
  --     colors['cava' .. i] = cava_colors[i]:to_rgb()
  --   end
  --   return colors
  -- end
  -- local cava_text = 'OK'

  -- local bars = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }

  -- local uv = vim.loop

  -- if _G._cava_stop then
  --   _G._cava_stop()
  -- end
  -- local cava_path = vim.fn.expand '$HOME/.config/nvim/.cava.sh'

  -- local stdin = uv.new_pipe(false)
  -- local stdout = uv.new_pipe(false)
  -- local stderr = uv.new_pipe(false)
  -- local handle = uv.spawn(cava_path, { stdio = { stdin, stdout, stderr } }, function()
  --   _G._cava_stop()
  -- end)

  -- uv.read_start(
  --   stdout,
  --   vim.schedule_wrap(function(err, data)
  --     if data then
  --       cava_text = data
  --     end
  --   end)
  -- )
  -- _G._cava_stop = function()
  --   stdin:read_stop()
  --   stdin:close()
  --   stdout:read_stop()
  --   stdout:close()
  --   stderr:read_stop()
  --   stderr:close()

  --   handle:close()
  --   _G._cava_stop = nil
  -- end
  vim.opt.laststatus = 3
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
        { '', 'Border' },
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
          { git_comps.git_branch { icon = '  ' }, 'GitBranchHl', 90 },
        }
      end
    end,
  }
  addComponent {
    name = 'LspName',
    hl_colors = {
      LspHl = { 'red', 'bg', 'bold' },
    },
    text = function(bufnr)
      if lsp_comps.check_lsp(bufnr) then
        return {
          { lsp_comps.lsp_name { icon = '   ' }, 'LspHl' },
        }
      end
    end,
  }
  addComponent {
    name = 'OSName',
    hl_colors = {
      osname = { 'blue', 'bg' },
    },
    text = function()
      local is_wsl = function()
        return os.getenv 'WSL_DISTRO_NAME' ~= nil
      end
      local is_mac = vim.fn.has 'macunix' == 1
      local system_name = not is_wsl() and not is_mac
      if system_name then
        return { { '   Linux x64', 'osname' } }
      elseif is_wsl() then
        return { { '  WSL', 'osname' } }
      elseif is_mac then
        return { { '  Darwin' } }
      end
    end,
  }
  addComponent {
    name = 'hbac',
    hl_colors = {
      pinned = { 'red', 'bg' },
    },
    text = function(bufnr)
      if require('hbac.state').is_pinned(bufnr) then
        return { { '  Pinned', 'pinned' } }
      else
        return { { '' } }
      end
    end,
  }
  addComponent {
    name = 'Sessions',
    hl_colors = {
      SessionHL = { 'green', 'bg' },
    },
    text = function()
      return SessionStatus
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
        return { { '' } }
      end
    end,
  }
  -- addComponent {
  --   name = 'Tags',
  --   hl_colors = { Tags = { 'blue', 'bg' } },
  --   text = function()
  --     if require('grapple').exists() then
  --       return { { '  笠[' .. require('grapple').key() .. ']', 'Tags' } }
  --     else
  --       return { { ' ' } }
  --     end
  --   end,
  -- }
  divideComps() -- End left side components
  addComponent {
    name = 'Hydra',
    hl_colors = {
      HydraHl = { 'blue', 'bg', 'bold' },
      FileNameHL = { 'green', 'bg', 'bold' },
    },
    text = function(bufnr)
      local hydrStatusline = require 'hydra.statusline'
      if hydrStatusline.is_active() then
        return {
          {
            '(' .. hydrStatusline.get_color() .. ') ' .. hydrStatusline.get_name() .. '  ',
            'HydraHl',
          },
        }
      elseif vim.bo.filetype == 'CompetiTest' and not vim.fn.pumvisible() then
        return {
          {
            vim.api.nvim_buf_get_var(bufnr, 'competitest_title'),
            'FileNameHL',
          },
        }
      else
        return {
          { ' ' },
          { b_components.cache_file_icon { default = '' }, 'FileNameHL' },
          { ' ' },
          { b_components.cache_file_name('[No Name]', 'unique'), 'FileNameHL' },
        }
      end
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
        { ' 󰉉 ', 'FSizeHl' },
        { b_components.cache_file_size(), 'FSizeHl' },
        { ' ' },
      }
    end,
  }
  -- addComponent {
  --   name = 'cava',
  --   hl_colors = {
  --     cava1 = { 'cava1', 'bg' },
  --     cava2 = { 'cava2', 'bg' },
  --     cava3 = { 'cava3', 'bg' },
  --     cava4 = { 'cava4', 'bg' },
  --     cava5 = { 'cava5', 'bg' },
  --     cava6 = { 'cava6', 'bg' },
  --     cava7 = { 'cava7', 'bg' },
  --     cava8 = { 'cava8', 'bg' },
  --   },
  --   text = function()
  --     local result = {}
  --     for i = 1, 40, 2 do
  --       local c = tonumber(cava_text:sub(i, i))
  --       if c then
  --         c = c + 1
  --         result[#result + 1] = { bars[c], 'cava' .. c }
  --       end
  --     end
  --     return result
  --   end,
  --   click = function()
  --     windline.change_colors(create_cava_colors(windline.get_colors()))
  --   end,
  -- }
  addComponent {
    name = 'Wpm',
    hl_colors = {
      WpmHl = { 'teal', 'bg', 'bold' },
    },
    text = function()
      return {
        { ' ' },
        { require('wpm').wpm, 'WpmHl' },
        { ' | ', 'WpmHl' },
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
          { git_comps.diff_added { format = ' %s ' }, 'DiffAdd' },
          { git_comps.diff_changed { format = ' %s ' }, 'DiffMod' },
          { git_comps.diff_removed { format = ' %s ' }, 'DiffRemove' },
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
    inactive = {},
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
      -- create_cava_colors(colors)
      return colors
    end,
    statuslines = { default },
  }
  windline.add_status(require('spectre.state_utils').status_line())
end

return config
