plugin {
  'akinsho/toggleterm.nvim',
  config = function()
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
  end,
  cmd = 'ToggleTerm',
}
