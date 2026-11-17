require('which-key').add {
  {
    '<leader>Mn',
    function()
      require('trailblazer').new_trail_mark()
    end,
    desc = 'New mark'
  },
}
