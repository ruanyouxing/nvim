plugin {
  'Pocco81/AutoSave.nvim',
  config = function()
    local autosave = require 'auto-save'
    autosave.setup {
      {
        execution_message = {
          message = function() -- message to print on save
            return ('AutoSave: saved at ' .. vim.fn.strftime '%H:%M:%S')
          end,
          dim = 0.18,               -- dim the color of `message`
          cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
      },
    }
  end,
}
plugin {
  'olimorris/persisted.nvim',
  config = function()
    require('persisted').setup {
      save_dir = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/'),
      autosave = true,
      should_autosave = true,
      use_git_branch = true,
      telescope = {
        reset_prompt_after_deletion = true,
      },
    }
  end,
}
plugin {
  'axkirillov/hbac.nvim',
  config = function()
    require('hbac').setup {
      autoclose = true,
      threshold = 5,
      close_command = function(bufnr)
        vim.api.nvim_buf_delete(bufnr, {})
      end,
      close_buffers_with_windows = false,
    }
  end,
  event = 'BufRead',
}
plugin {
  'famiu/bufdelete.nvim',
  event = 'BufDelete',
}
