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


function tools.hop()
  require('hop').setup {
    keys = 'etovxqpdygfblzhckisuran',
  }
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

function tools.navbuddy()
  require('nvim-navbuddy').setup {
    lsp = {
      auto_attach = true,
    },
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

  local hint_config = {
    position = 'middle',
    border = 'rounded',
  }
  local lsp_hints = [[

  LSP:

     _ca_: Code actions      _K_: Hover               _r_: References          _f_: Format                ^

     _R_: Rename             _d_: Go to definition    _s_: Document symbols    _i_: Implementations       ^

  ]]
  Hydra {
    name = 'LSP actions',
    hint = lsp_hints,
    config = {
      color = 'blue',
      invoke_on_body = true,
      hint = hint_config,
    },
    mode = { 'n', 'x', 'v', 'o' },
    body = '<Leader>l',
    heads = {
      {
        'i',
        function()
          vim.lsp.buf.implementation()
        end,
      },
      {
        's',
        function()
          vim.lsp.buf.document_symbol()
        end,
      },
      {
        'd',
        function()
          vim.lsp.buf.definition { reuse_win = true }
        end,
        { exit = true },
      },
      {
        'R',
        function()
          vim.lsp.buf.rename()
        end,
      },
      {
        'ca',
        function()
          vim.lsp.buf.code_action()
        end,
      },
      {
        'K',
        function()
          vim.lsp.buf.hover()
        end,
      },
      {
        'r',
        function()
          vim.lsp.buf.references()
        end,
      },
      {
        'f',
        function()
          vim.lsp.buf.format()
        end,
      },
    },
  }
end

function tools.overseer()
  require('overseer').setup {
    templates = { 'builtin', 'cpp_build' },
  }
end

function tools.stay_in_place()
  require('stay-in-place').setup {
    set_keymaps = true,
    preserve_visual_selection = true,
  }
end

function tools.spectre()
  require('spectre').setup {
    replace_vim_cmd = 'cdo',
    is_open_target_win = true,
    is_insert_mode = true,
  }
end

function tools.telescope()
  local actions = require 'telescope.actions'
  require('telescope').load_extension 'zoxide'
  require('telescope').load_extension 'media_files'
  require('telescope').load_extension 'notify'
  require('telescope').load_extension 'persisted'
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
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return term.name
      end,
    },
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
    modes = {
      -- configurations per mode
      ataraxis = {
        shade = 'dark',
        backdrop = 0,
        minimum_writing_area = {
          -- minimum size of main window
          width = 70,
          height = 44,
        },
        quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
        padding = {
          -- padding windows
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
        options = {
          -- options to be disabled when entering Minimalist mode
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
  local utils = require 'yanky.utils'
  local mapping = require 'yanky.telescope.mapping'
  require('yanky').setup {
    ring = {
      history_length = 500,
      storage = 'shada',
    },
    preserve_cursor_position = {
      enabled = true,
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    picker = {
      telescope = {
        mappings = {
          default = mapping.put 'p',
          i = {
            ['<c-p>'] = mapping.put 'p',
            ['<c-k>'] = mapping.put 'P',
            ['<c-x>'] = mapping.delete(),
            ['<c-r>'] = mapping.set_register(utils.get_default_register()),
          },
          n = {
            p = mapping.put 'p',
            P = mapping.put 'P',
            d = mapping.delete(),
            r = mapping.set_register(utils.get_default_register()),
          },
        },
      },
    },
  }
end


function tools.autoclose()
  require('hbac').setup {
    autoclose = true,
    threshold = 5,
    close_command = function(bufnr)
      vim.api.nvim_buf_delete(bufnr, {})
    end,
    close_buffers_with_windows = false,
  }
end

function tools.cptest()
  require('competitest').setup {
    runner_ui = {
      interface = 'split',
      show_nu = false,
      selector_show_nu = false,
    },
    split_ui = {
      total_width = 0.35,
      vertical_layout = {
        { 1, 'tc' },
        { 1, { { 1, 'si' }, { 1, 'eo' } } },
        { 1, { { 1, 'so' }, { 1, 'se' } } },
      },
    },
    editor_ui = {
      show_nu = false,
    },
    testcases_single_file_format = '.$(FNOEXT)_task$(TCNUM).tc',
    testcases_input_file_format = '.$(FNOEXT)_case$(TCNUM).inp',
    testcases_output_file_format = '.$(FNOEXT)_case$(TCNUM).out',
  }
end

return tools
