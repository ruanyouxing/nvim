require('which-key').add {
  {
    '<leader>gd',
    function()
      require('which-key').show {
        keys = '<leader>gd',
      }
    end,
    desc = 'Diff',
  },
  {
    '<leader>gdo',
    function()
      vim.cmd [[DiffviewOpen]]
    end,
    desc = 'Diffview: Open',
  },
  {
    '<leader>gdc',
    function()
      vim.cmd [[DiffviewClose]]
    end,
    desc = 'Diffview: Close',
  },
  {
    '<leader>gdh',
    function()
      vim.cmd [[DiffviewFileHistory]]
    end,
    desc = 'Diffview: File history',
  },
  {
    '<leader>gdt',
    function()
      require('gitsigns').diffthis()
    end,
    desc = 'Diff this',
  },
  {
    '<leader>gdw',
    function()
      require('gitsigns').toggle_word_diff()
    end,
    desc = 'Word diff',
  },
  {
    '<leader>gbl',
    function()
      require('which-key').show {
        keys = '<leader>gbl',
      }
    end,
    desc = 'Blame',
  },
  {
    '<leader>gbl<leader>',
    function()
      require('gitsigns').toggle_current_line_blame()
    end,
    desc = 'Toggle blame current line',
  },
  {
    '<leader>gbll',
    function()
      require('gitsigns').blame_line { full = true }
    end,
    desc = 'Blame current line',
  },
  {
    '<leader>gbld',
    function()
      require('gitsigns').toggle_deleted()
    end,
    desc = 'Blame deleted',
  },
  {
    '<leader>gh',
    function()
      require('which-key').show { keys = '<leader>gh' }
    end,
    desc = 'Hunk',
  },
  {
    '<leader>ghp',
    function()
      require('gitsigns').preview_hunk()
    end,
    desc = 'Preview hunk',
  },
  {
    '<leader>ghs',
    function()
      require('gitsigns').stage_hunk()
    end,
    desc = 'Stage hunk',
  },
  {
    '<leader>ghS',
    function()
      require('gitsigns').undo_stage_hunk()
    end,
    desc = 'Undo stage hunk',
  },
  {
    '<leader>ghr',
    function()
      require('gitsigns').reset_hunk()
    end,
    desc = 'Reset hunk',
  },
  {
    '<leader>gs',
    desc = 'Gitsigns show',
    function()
      require('gitsigns').show()
    end,
  },
  {
    '<leader>gbf',
    desc = 'Buffer',
    function()
      require('which-key').show {
        keys = '<leader>gbf',
      }
    end,
  },
  {
    '<leader>gbfr',
    desc = 'Reset buffer',
    function()
      require('gitsigns').reset_buffer()
    end,
  },
  {
    '<leader>gbfs',
    desc = 'Stage buffer',
    function()
      require('gitsigns').stage_buffer()
    end,
  },
}
