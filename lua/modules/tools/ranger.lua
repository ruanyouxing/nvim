plugin {
  'is0n/fm-nvim',
  config = function()
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
  end,
  cmd = 'Ranger',
}
