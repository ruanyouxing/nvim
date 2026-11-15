local is_gitrepo = function()
  local is_repo = vim.fn.system 'git rev-parse --is-inside-work-tree'
  if vim.v.shell_error == 0 then
    return true
  end
  return false
end
return {
  {
    'dlyongemallo/diffview-plus.nvim',
    version = '*',
    opts = {
      enhanced_diff_hl = true,
      use_icons = true,
      view = {
        default = { layout = 'diff2_horizontal' },
        merge_tool = { layout = 'diff3_horizontal' },
      },
      file_panel = {
        listing_style = 'tree',
        win_config = { position = 'left', width = 35 },
      },
      clean_up_buffers = true,
      hide_merge_artifacts = true,
      auto_close_on_empty = true,
    },
    cmd = {
      'DiffviewOpen',
      'DiffviewToggle',
      'DiffviewFileHistory',
      'DiffviewDiffFiles',
      'DiffviewLog',
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '▌' },
        change = { text = '▌' },
        delete = { text = '▌' },
        topdelete = { text = '▌' },
        changedelete = { text = '▌' },
      },
      preview_config = { border = 'rounded' },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 100,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y:%m-%d>, <summary>',
    },
    cond = is_gitrepo,
  },
}
