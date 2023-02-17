local tools = {}

function tools.fm()
  require('fm-nvim').setup {
    -- (Vim) Command used to open files
    edit_cmd = 'edit',

    on_close = {},
    on_open = {},
    ui = {
      default = 'float',
      float = {
        border = 'none',
        float_hl = 'Normal',
        border_hl = 'FloatBorder',
        blend = 0,
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
      },
      split = {
        direction = 'topleft',
        size = 24,
      },
    },
    cmds = {
      ranger_cmd = 'ranger',
      lazygit_cmd = 'lazygit',
    },

    mappings = {
      vert_split = '<C-v>',
      horz_split = '<C-h>',
      tabedit = '<C-t>',
      edit = '<C-e>',
      ESC = '<ESC>',
    },

    broot_conf = vim.fn.stdpath 'data' .. '/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson',
  }
end

function tools.fold_preview()
  require('fold-preview').setup {
    border = 'rounded',
    default_keybindings = false,
  }
  vim.api.nvim_create_autocmd('CursorHold', {
    pattern = '*',
    callback = function()
      require('fold-preview').show_preview()
    end,
  })
end

function tools.highlight()
  local high_str = require 'high-str'

  high_str.setup {
    verbosity = 0,
    saving_path = '/tmp/highstr/',
    highlight_colors = {
      -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
      color_0 = { '#0c0d0e', 'smart' }, -- Cosmic charcoal
      color_1 = { '#e5c07b', 'smart' }, -- Pastel yellow
      color_2 = { '#7FFFD4', 'smart' }, -- Aqua menthe
      color_3 = { '#8A2BE2', 'smart' }, -- Proton purple
      color_4 = { '#FF4500', 'smart' }, -- Orange red
      color_5 = { '#008000', 'smart' }, -- Office green
      color_6 = { '#0000FF', 'smart' }, -- Just blue
      color_7 = { '#FFC0CB', 'smart' }, -- Blush pink
      color_8 = { '#FFF9E3', 'smart' }, -- Cosmic latte
      color_9 = { '#7d5c34', 'smart' }, -- Fallow brown
    },
  }
end

function tools.mason_tools()
  require('mason-tool-installer').setup {
    ensure_installed = {
      'prettier',
      'clang-format',
      'debugpy',
      'codelldb',
      'black',
      'stylua',
      'shellcheck',
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 3000, -- 3 second delay
  }
end

function tools.keystack()
  _G.DAPStopped = true
  local keystack = require 'keystack'

  keystack.config {
    default_opts = { silent = true, noremap = true },
    default_exit_key = { 'q', '<ESC>' },
    default_mode = 'n',
    mappings = {
      exit_key = { 'q', '<ESC>' },
      ['debugging'] = {
        opts = { silent = true, noremap = true },
        maps = {
          ['c'] = function()
            require('dap').run_to_cursor()
          end,
          ['<C-c>'] = function()
            require('dap').terminate()
          end,
          ['K'] = function()
            require('dap.ui.widgets').hover()
          end,
          ['<F5>'] = function()
            require('dapui').open()
          end,
          ['<C-r>'] = function()
            require('dap_setup').reload_continue()
          end,
          ['R'] = function()
            require('dap').repl.toggle()
          end,
          ['s'] = function()
            require('dap.ui.variables').scope()
          end,
          ['<Space>'] = function()
            require('dap').toggle_breakpoint()
          end,
          ['['] = function()
            require('dap').step_over()
          end,
          [']'] = function()
            require('dap').step_into()
          end,
          ['B'] = function()
            require('dap').step_out()
          end,
          ['b'] = function()
            require('dap').step_back()
          end,
          ['D'] = function()
            require('dap').clear_breakpoints()
          end,
          ['e'] = function()
            require('dapui').eval()
          end,
          ['<C-S-d>'] = function()
            if DAPStopped then
              require('dap').continue()
              print 'Starting DAP...'
              DAPStopped = false
            else
              require('dap').close()
              print 'DAP Stopped.'
              DAPStopped = true
            end
          end,
        },
      },
    },
  }
end

function tools.hydra()
  local Hydra = require 'hydra'

  local function cmd(command)
    return table.concat { '<Cmd>', command, '<CR>' }
  end

  local hint = [[
  _C_: Colorschemes

  _/_: Search in files  _p_: Pick buffer

  _c_: Close buffer

  _g_: Open diffs       _d_: Debugging mode

  _t_: Terminal         _s_: Stage buffer

  _<Enter>_: Telescope           _<Esc>_
  ]]

  Hydra {
    name = 'Buffers',
    hint = hint,
    config = {
      color = 'teal',
      invoke_on_body = true,
      hint = {
        position = 'middle-right',
        border = 'rounded',
      },
    },
    mode = { 'n', 'v', 'x', 'o' },
    body = '<Leader>h',
    heads = {
      { 'g',       cmd 'DiffviewOpen' },
      { 'd',       cmd 'lua require("keystack").push("debugging")' },
      { 's',       cmd 'Gitsigns stage_buffer' },
      { 'p',       '<Plug>(cokeline-pick-focus)' },
      { 'c',       '<Plug>(cokeline-pick-close)' },
      { 'C',       cmd 'Telescope colorscheme' },
      { '/',       cmd 'Telescope current_buffer_fuzzy_find',      { desc = 'Search in file' } },
      { '?',       cmd 'Telescope search_history',                 { desc = 'Search history' } },
      { 't',       cmd 'ToggleTerm directon=float' },
      { '<Enter>', cmd 'Telescope',                                { exit = true, desc = 'List all pickers' } },
      { '<Esc>',   nil,                                            { exit = true, nowait = true } },
    },
  }
end

function tools.sniprun()
  require('sniprun').setup {
    selected_interpreters = {},
    repl_enable = {},
    repl_disable = {},

    interpreter_options = {
      GFM_original = {
        use_on_filetypes = { 'markdown.pandoc' },
      },
      Python3_original = {
        error_truncate = 'auto',
      },
    },

    display = {
      'Classic',
      'VirtualTextOk',
      'VirtualTextErr', --# display error results as virtual text
      'TempFloatingWindow', --# display results in a floating window
      'LongTempFloatingWindow', --# same as above, but only long results. To use with VirtualText__
      'Terminal', --# display results in a vertical split
      'TerminalWithCode', --# display results and code history in a vertical split
      'NvimNotify', --# display with the nvim-notify plugin
      'Api', --# return output to a programming interface
    },
    display_options = {
      terminal_width = 45, --# change the terminal display option width
      notification_timeout = 5, --# timeout for nvim_notify output
    },
    show_no_output = {
      'Classic',
      'TempFloatingWindow',
    },

    snipruncolors = {
      SniprunVirtualTextOk = { bg = '#66eeff', fg = '#000000', ctermbg = 'Cyan', cterfg = 'Black' },
      SniprunFloatingWinOk = { fg = '#66eeff', ctermfg = 'Cyan' },
      SniprunVirtualTextErr = { bg = '#881515', fg = '#000000', ctermbg = 'DarkRed', cterfg = 'Black' },
      SniprunFloatingWinErr = { fg = '#881515', ctermfg = 'DarkRed' },
    },

    inline_messages = 0, --# inline_message (0/1) is a one-line way to display messages

    borders = 'single', --# display borders around floating windows
    live_mode_toggle = 'off', --# live mode toggle, see Usage - Running for more info
  }
end

function tools.stay_in_place()
  require('stay-in-place').setup {
    set_keymaps = true,
    preserve_visual_selection = true,
  }
end

function tools.telescope()
  local actions = require 'telescope.actions'
  require('telescope').load_extension 'zoxide'
  require('telescope').load_extension 'media_files'
  require('telescope').load_extension 'notify'
  require('telescope').setup {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
      n = {
        ['q'] = actions.close,
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  }
end

function tools.toggleterm()
  require('toggleterm').setup {
    size = 7,
    border = 'curved',
    hide_numbers = true,
    shade_filetypes = { 'none', 'fzf' },
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    direction = 'horizontal',
    persist_size = true,
    shell = 'zsh',
    close_on_exit = true,
  }
end

function tools.zenmode()
  require('true-zen').setup {
    modes = { -- configurations per mode
      ataraxis = {
        shade = 'dark',
        backdrop = 0,
        minimum_writing_area = { -- minimum size of main window
          width = 70,
          height = 44,
        },
        quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
        padding = { -- padding windows
          left = 52,
          right = 52,
          top = 0,
          bottom = 0,
        },
        open_callback = nil, -- run a function when opening Ataraxis mode
        close_callback = nil, -- run a function when closing Ataraxis mode
      },
      minimalist = {
        ignored_buf_types = { 'nofile' }, -- save current options from any window except ones displaying these kinds of buffers
        options = { -- options to be disabled when entering Minimalist mode
          number = false,
          relativenumber = false,
          showtabline = 0,
          signcolumn = 'no',
          statusline = '',
          cmdheight = 1,
          laststatus = 0,
          showcmd = false,
          showmode = false,
          ruler = false,
          numberwidth = 1,
        },
        open_callback = nil, -- run a function when opening Minimalist mode
        close_callback = nil, -- run a function when closing Minimalist mode
      },
      narrow = {
        folds_style = 'informative',
        run_ataraxis = true, -- display narrowed text in a Ataraxis session
        open_callback = nil, -- run a function when opening Narrow mode
        close_callback = nil, -- run a function when closing Narrow mode
      },
      focus = {
        open_callback = nil, -- run a function when opening Focus mode
        close_callback = nil, -- run a function when closing Focus mode
      },
    },
    integrations = {
      tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
      twilight = true,
    },
  }
end

function tools.yank()
  local utils = require('yanky.utils')
  local mapping = require('yanky.telescope.mapping')
  require('yanky').setup {
    ring = {
      history_length = 500,
      storage = 'shada',
    },
    preserve_cursor_position = {
      enabled = true
    },
    system_clipboard = {
      sync_with_ring = true,
    },
     picker = {
    telescope = {
      mappings = {
        default = mapping.put("p"),
        i = {
          ["<c-p>"] = mapping.put("p"),
          ["<c-k>"] = mapping.put("P"),
          ["<c-x>"] = mapping.delete(),
          ["<c-r>"] = mapping.set_register(utils.get_default_register()),
        },
        n = {
          p = mapping.put("p"),
          P = mapping.put("P"),
          d = mapping.delete(),
          r = mapping.set_register(utils.get_default_register())
        },
      }
    }
  }
  }
end

function tools.zoom()
  require('neo-zoom').setup {
    winopts = {
      offset = {
        width = 150,
        height = 0.85,
      },
      border = 'double',
    },
    exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
    exclude_buftypes = { 'terminal' },
    presets = {
      {
        filetypes = { 'dapui_.*', 'dap-repl' },
        config = {
          top = 0.25,
          left = 0.6,
          width = 0.4,
          height = 0.65,
        },
        callbacks = {
          function()
            vim.wo.wrap = true
          end,
        },
      },
    },
    popup = {
      enabled = true,
      exclude_filetypes = {},
      exclude_buftypes = {},
    },
  }
end

return tools
