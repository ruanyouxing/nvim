return {
  {
    'Pocco81/AutoSave.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'olimorris/persisted.nvim',
    event = 'VeryLazy',
    opts = {
      save_dir = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/'),
      autosave = true,
      should_autosave = true,
      use_git_branch = true,
      telescope = {
        reset_prompt_after_deletion = true,
      },
    },
  },
  {
    'axkirillov/hbac.nvim',
    opts = {
      autoclose = true,
      threshold = 5,
      close_command = function(bufnr)
        vim.api.nvim_buf_delete(bufnr, {})
      end,
      close_buffers_with_windows = false,
    },
    event = 'VeryLazy',
  },
}
