require('which-key').add {
  {
    '<leader>mn',
    function()
      require('trailblazer').new_trail_mark()
    end,
    desc = 'New mark',
  },
  {
    '<leader>mx',
    function()
      require('trailblazer').delete_all_trail_marks()
    end,
    desc = 'Delete all marks',
  },
  {
    '<leader>ml',
    function()
      require('trailblazer').toggle_trail_mark_list()
    end,
    desc = 'List marks',
  },
}
