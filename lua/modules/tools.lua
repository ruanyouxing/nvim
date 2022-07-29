local tools = {}
function tools.hydra()
  local Hydra = require('hydra')

  local function cmd(command)
    return table.concat({ '<Cmd>', command, '<CR>' })
  end

  local hint = [[
  _C_: Colorschemes

  _/_: Search in files  _p_: Pick buffer

  _r_: Run code         _c_: Close buffer

  _?_: Search history   _d_: Open diffs

  _t_: Terminal         _s_: Stage buffer

  _<Enter>_: Telescope           _<Esc>_
  ]]

  Hydra({
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
      { 'r', cmd('SnipRun') },
      { 'd', cmd('DiffviewOpen') },
      { 's', cmd('Gitsigns stage_buffer') },
      { 'p', '<Plug>(cokeline-pick-focus)' },
      { 'c', '<Plug>(cokeline-pick-close)' },
      { 'C', cmd('Telescope colorscheme') },
      { '/', cmd('Telescope current_buffer_fuzzy_find'), { desc = 'Search in file' } },
      { '?', cmd('Telescope search_history'), { desc = 'Search history' } },
      { 't', cmd('ToggleTerm directon=float') },
      { '<Enter>', cmd('Telescope'), { exit = true, desc = 'List all pickers' } },
      { '<Esc>', nil, { exit = true, nowait = true } },
    },
  })
end

function tools.sniprun()
  require('sniprun').setup({
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
  })
end

function tools.telescope()
  local actions = require('telescope.actions')
  require('telescope').load_extension('zoxide')
  require('telescope').load_extension('notify')
  require('telescope').setup({
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
      n = {
        ['q'] = actions.close,
      },
    },
  })
end

function tools.toggleterm()
  vim.cmd([[packadd toggleterm.nvim]])
  require('toggleterm').setup({
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
  })
end

return tools
