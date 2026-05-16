return {
  {
    'luukvbaal/statuscol.nvim',
    opts = function()
      local builtin = require 'statuscol.builtin'
      return {
        ft_ignore = { 'NvimTree', 'Trouble', 'undotree' },
        segments = {
          { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
          { text = { '%s' },             click = 'v:lua.ScSa' },
          {
            text = { builtin.lnumfunc, ' ' },
            condition = { true, builtin.not_empty },
            click = 'v:lua.ScLa',
          },
        },
      }
    end,
    event = 'BufWinEnter',
  },
  {
    'lukas-reineke/virt-column.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {}
  },
}
