local editor = {}

function editor.autosave()
  local autosave = require 'auto-save'
  autosave.setup {
    {
      execution_message = {
        message = function() -- message to print on save
          return ('AutoSave: saved at ' .. vim.fn.strftime '%H:%M:%S')
        end,
        dim = 0.18, -- dim the color of `message`
        cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
    },
  }
end

function editor.autosession()
  require('auto-session').setup {
    log_level = 'info',
    auto_session_enable_last_session = true,
    auto_session_root_dir = vim.fn.stdpath 'data' .. '/session',
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enable = true,
    auto_session_suppress_dirs = nil,
  }
end

function editor.better_escape()
  require('better_escape').setup {
    mapping = { 'jk', 'jj' },
    timeout = 100,
    clear_empty_lines = true,
    keys = function()
      return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>' or '<esc>'
    end,
  }
end

function editor.diffview()
  local cb = require('diffview.config').diffview_callback
  require('diffview').setup {
    diff_binaries = false, -- Show diffs for binaries
    enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
    use_icons = true, -- Requires nvim-web-devicons
    icons = { -- Only applies when use_icons is true.
      folder_closed = '',
      folder_open = '',
    },
    signs = {
      fold_closed = '',
      fold_open = '',
    },
    default_args = { -- Default args prepended to the arg-list for the listed commands
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },
    hooks = {}, -- See ':h diffview-config-hooks'
    key_bindings = {
      disable_defaults = false, -- Disable the default key bindings
      view = {
        ['<tab>'] = cb 'select_next_entry', -- Open the diff for the next file
        ['<s-tab>'] = cb 'select_prev_entry', -- Open the diff for the previous file
        ['gf'] = cb 'goto_file', -- Open the file in a new split in previous tabpage
        ['<C-w><C-f>'] = cb 'goto_file_split', -- Open the file in a new split
        ['<C-w>gf'] = cb 'goto_file_tab', -- Open the file in a new tabpage
        ['<leader>e'] = cb 'focus_files', -- Bring focus to the files panel
        ['<leader>b'] = cb 'toggle_files', -- Toggle the files panel.
      },
      file_history_panel = {
        ['g!'] = cb 'options', -- Open the option panel
        ['<C-A-d>'] = cb 'open_in_diffview', -- Open the entry under the cursor in a diffview
        ['y'] = cb 'copy_hash', -- Copy the commit hash of the entry under the cursor
        ['zR'] = cb 'open_all_folds',
        ['zM'] = cb 'close_all_folds',
        ['j'] = cb 'next_entry',
        ['<down>'] = cb 'next_entry',
        ['k'] = cb 'prev_entry',
        ['<up>'] = cb 'prev_entry',
        ['<cr>'] = cb 'select_entry',
        ['o'] = cb 'select_entry',
        ['<2-LeftMouse>'] = cb 'select_entry',
        ['<tab>'] = cb 'select_next_entry',
        ['<s-tab>'] = cb 'select_prev_entry',
        ['gf'] = cb 'goto_file',
        ['<C-w><C-f>'] = cb 'goto_file_split',
        ['<C-w>gf'] = cb 'goto_file_tab',
        ['<leader>e'] = cb 'focus_files',
        ['<leader>b'] = cb 'toggle_files',
      },
      option_panel = {
        ['<tab>'] = cb 'select',
        ['q'] = cb 'close',
      },
    },
  }
end

function editor.comment()
  require('nvim_comment').setup {
    comment_empty = false,
    create_mappings = true,
    line_mapping = 'gcc',
    operator_mapping = 'gc',
    hook = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end,
  }
end

function editor.gitsigns()
  require('gitsigns').setup {
    signs = {
      add = { text = '▌' },
      change = { text = '▌' },
      delete = { text = '▌' },
      topdelete = { text = '▌' },
      changedelete = { text = '▌' },
    },
    preview_config = { border = 'rounded' },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 100,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y:%m-%d>, <summary>',
  }
end

function editor.treesitter()
  require('nvim-treesitter.configs').setup {
    sync_install = false,
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    autotag = {
      enable = true,
      filetypes = { 'html', 'xml' },
    },
    context_commentstring = { enable = true },
    matchup = {
      enable = true,
    },
    refactor = {
      highlight_definitions = { enable = true, enable_autocmd = false },
      highlight_current_scope = { enable = true },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = 'grr',
        },
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        peek_definition_code = {
          ['<leader>df'] = '@function.outer',
          ['<leader>dF'] = '@class.outer',
        },
      },
    },
  }
end

function editor.ts_context()
  require('treesitter-context').setup {
    enable = true,
    throttle = true,
    max_lines = 0,
    patterns = {
      default = {
        'class',
        'function',
        'method',
        'for',
        'while',
        'if',
        'switch',
        'case',
      },
    },
    exact_patterns = {},
  }
end

function editor.tabout()
  require('tabout').setup {
    tabkey = '<Tab>',
    backwards_tabkey = '<S-Tab>',
    ignore_beginning = false,
    act_as_tab = true,
    enable_backward = true,
    completion = true,
    tabouts = {
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = '`', close = '`' },
      { open = '(', close = ')' },
      { open = '{', close = '}' },
      { open = '<', close = '>' },
      { open = '[', close = ']' },
    },
    exclude = {},
  }
end

return editor
