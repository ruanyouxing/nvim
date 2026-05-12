_G.SessionStatus = _G.SessionStatus or ""

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'BufWinEnter',
    config = function()
      local colors = {
        bg         = vim.api.nvim_get_hl(0, { name = 'StatusLine' }).bg or '#22252A',
        fg         = vim.api.nvim_get_hl(0, { name = 'StatusLine' }).fg or '#C5CDD9',
        teal       = '#5e9db2',
        red        = '#ec5767',
        yellow     = '#ecbe7b',
        blue       = '#51afef',
        orange     = '#ff8800',
        orange_alt = '#ff9e64',
        green      = '#98be65',
        purple     = '#a020f0',
      }

      -- Custom Component Functions
      local function better_escape()
        local ok, m = pcall(require, 'better_escape')
        return (ok and m.waiting) and '✺' or ''
      end

      local function lsp_name()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients == 0 then return '' end

        local names = {}
        for _, client in ipairs(clients) do
          if client.name ~= 'null-ls' then
            table.insert(names, client.name)
          end
        end

        -- Nếu sau khi lọc không còn server nào thì trả về chuỗi rỗng
        if #names == 0 then return '' end

        return '  ' .. table.concat(names, ', ')
      end

      local function os_name()
        if os.getenv('WSL_DISTRO_NAME') ~= nil then
          return ''
        elseif vim.fn.has('macunix') == 1 then
          return ''
        else
          return '  NixOS'
        end
      end

      local function hbac_status()
        local ok, state = pcall(require, 'hbac.state')
        if ok and state.is_pinned(vim.api.nvim_get_current_buf()) then
          return ' Pinned'
        end
        return ''
      end

      local function lazy_updates()
        local ok, lazy_status = pcall(require, 'lazy.status')
        if ok and lazy_status.has_updates() then
          return lazy_status.updates()
        end
        return ''
      end

      local function custom_filename()
        local ok_h, hydra = pcall(require, 'hydra.statusline')
        if ok_h and hydra.is_active() then
          return '(' .. hydra.get_color() .. ') ' .. hydra.get_name()
        end
        if vim.bo.filetype == 'CompetiTest' and not vim.fn.pumvisible() then
          local ok, title = pcall(vim.api.nvim_buf_get_var, 0, 'competitest_title')
          if ok then return title end
        end
        return ''
      end

      local function wpm_graph()
        local ok, w = pcall(require, 'wpm')
        if ok then
          return (w.wpm() or 0) .. ' | ' .. (w.historic_graph() or '')
        end
        return ''
      end

      require('lualine').setup {
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = {
            -- left = '',
            left = '',
            -- right = '',
            right = ''
          },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                local mode_names = {
                  NORMAL = 'Norm',
                  INSERT = 'Ins',
                  VISUAL = 'Visl',
                  ['V-LINE'] = 'VLine',
                  ['V-BLOCK'] = 'VBlck',
                  REPLACE = 'Rplc',
                  COMMAND = 'Com',
                  TERMINAL = 'Shell',
                }
                return mode_names[str] or str
              end,
            },
            { better_escape },
          },
          lualine_b = {
            { 'branch', icon = '', color = { fg = colors.orange, gui = 'bold', bg = 'NONE' } },
            { lsp_name, color = { fg = colors.red, gui = 'bold', bg = 'NONE' } },
            { os_name, color = { fg = colors.blue, bg = 'NONE' } },
            { hbac_status, color = { fg = colors.red, bg = 'NONE' } },
            { function() return _G.SessionStatus or "" end, color = { fg = colors.green, bg = 'NONE' } },
            { lazy_updates, color = { fg = colors.orange_alt, bg = 'NONE' } },
          },
          lualine_c = {
            {
              function()
                return "%="
              end
            },
            { custom_filename, color = { fg = colors.blue, gui = 'bold' } },
            {
              'filename',
              file_status = true,
              path = 0,
              symbols = { unnamed = '', readonly = '', modified = '' },
              color = { fg = colors.green, gui = 'bold' },
              cond = function()
                local ok_h, hydra = pcall(require, 'hydra.statusline')
                if ok_h and hydra.is_active() then return false end
                if vim.bo.filetype == 'CompetiTest' then return false end
                return true
              end,
            }
          },
          lualine_x = {
            { 'filesize', icon = '󰉉', color = { fg = colors.blue, gui = 'bold' } },
            { wpm_graph, color = { fg = colors.teal, gui = 'bold' } },
          },
          lualine_y = {
            {
              'diff',
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.purple },
                removed = { fg = colors.orange },
              },
            },
          },
          lualine_z = {
            { 'location', color = { fg = colors.orange, gui = 'bold', bg = 'NONE' } },
            { 'progress', color = { fg = colors.blue, gui = 'bold', bg = 'NONE' } },
          }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { 'nvim-tree', 'quickfix', 'lazy' }
      }
    end,
  },
  {
    'jcdickinson/wpm.nvim',
    opts = {
      sample_interval = 1000
    },
    event = 'BufEnter',
  }
}
