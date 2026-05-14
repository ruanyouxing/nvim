return {
  'LeonHeidelbach/trailblazer.nvim',
  opts = {
    event_list = {
      'TrailBlazerTrailMarkStackSaved',
      'TrailBlazerTrailMarkStackDeleted',
      'TrailBlazerCurrentTrailMarkStackChanged',
      'TrailBlazerTrailMarkStackSortModeChanged',
    },
    auto_save_trailblazer_state_on_exit = true,
    auto_load_trailblazer_state_on_enter = true,
    custom_session_storage_dir = vim.fn.stdpath 'data' .. '/trailblazer/',
    mappings = {},
  },
  keys = {
    {
      'mm',
      function()
        require('trailblazer').new_trail_mark()
      end,
    },
  },
  lazy = true,
}
