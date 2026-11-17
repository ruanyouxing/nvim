require('which-key').add {
  {
    '<leader>Gdo',
    function()
      vim.cmd [[DiffviewOpen]]
    end,
    desc = 'Diffview: Open',
  },
  {
    '<leader>Gdc',
    function()
      vim.cmd [[DiffviewClose]]
    end,
    desc = 'Diffview: Close',
  },
  {
    '<leader>Gdh',
    function()
      vim.cmd [[DiffviewFileHistory]]
    end,
    desc = 'Diffview: File history',
  },
  {
    '<leader>Gdt',
    function()
      require('gitsigns').diffthis()
    end,
    desc = 'Diff this',
  },
  {
    '<leader>Gb<leader>',
    function()
      require('gitsigns').toggle_current_line_blame()
    end,
    desc = 'Toggle blame current line',
  },
  {
    '<leader>Gbl',
    function()
      require('gitsigns').blame_line { full = true }
    end,
    desc = 'Blame current line',
  },
  {
    '<leader>Gbd',
    function()
      require('gitsigns').toggle_deleted()
    end,
    desc = 'Git blame deleted',
  },
  {
    '<leader>Ghp',
    function()
      require('gitsigns').preview_hunk()
    end,
    desc = 'Git preview hunk',
  },
  {
    '<leader>Ghs',
    function()
      require('gitsigns').stage_hunk()
    end,
    desc = 'Git stage hunk',
  },
  {
    '<leader>GhS',
    function()
      require('gitsigns').undo_stage_hunk()
    end,
    desc = 'Git undo stage hunk',
  },
  {
    '<leader>Ghr',
    function()
      require('gitsigns').reset_hunk()
    end,
    desc = 'Git reset hunk',
  },
  {
    '<leader>Gs',
    desc = 'Gitsigns show',
    function()
      require('gitsigns').show()
    end,
  },
  {
    '<leader>Gbr',
    desc = 'Git reset buffer',
    function()
      require('gitsigns').reset_buffer()
    end,
  },
  {
    '<leader>Gbs',
    desc = 'Git stage buffer',
    function()
      require('gitsigns').stage_buffer()
    end,
  },
}
