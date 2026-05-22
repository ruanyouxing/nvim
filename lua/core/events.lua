_G.SessionStatus = ''
local autocmd = vim.api.nvim_create_autocmd
local all = '*'
local User = { 'User' }
autocmd({ 'TextYankPost' }, {
  pattern = all,
  callback = function()
    vim.highlight.on_yank()
  end,
})
autocmd(User, {
  pattern = 'PersistedLoadPost',
  callback = function()
    _G.SessionStatus = ' Session loaded'
    require 'trailblazer'
    vim.notify 'Session loaded'
    _G.SessionStatus = '󰸞 '
  end,
})

autocmd(User, {
  pattern = 'PersistedSavePost',
  callback = function()
    require('trailblazer').save_trailblazer_state_to_file()
    vim.notify 'Session saved'
    _G.SessionStatus = '󰉉 '
  end,
})

autocmd(User, {
  pattern = 'PersistedDeletePost',
  callback = function()
    vim.notify 'Session removed'
    _G.SessionStatus = '󰩹 '
  end,
})
autocmd({ 'FileType' }, {
  pattern = 'css',
  callback = function()
    vim.cmd [[ColorizerToggle]]
  end,
})
local treesitter_augroup = vim.api.nvim_create_augroup('nvim_treesitter', { clear = true })
autocmd('FileType', {
  pattern = all,
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

autocmd({ 'BufReadPre', 'BufNewFile' }, {
  pattern = all,
  once = true,
  callback = function()
    require 'core.lsp'
  end,
})
autocmd({
  'BufWinEnter',
  'CursorHold',
  'InsertLeave',
  'BufWritePost',
  'TextChanged',
  'TextChangedI',
}, {
  group = vim.api.nvim_create_augroup('barbecue.updater', {}),
  callback = function()
    if package.loaded['barbecue.ui'] then
      require('barbecue.ui').update()
    end
  end,
})
-- autocmd({ 'CursorMoved' }, {
--   pattern = '*',
--   callback = function()
--     require('specs').show_specs()
--   end,
-- })

autocmd('ColorScheme', {
  pattern = all,
  callback = function()
    vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
    vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
    vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
    vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
    vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
    vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
    vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
  end,
})


autocmd({ "InsertLeave", "BufLeave", "FocusLost", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("SmartAutoSave", { clear = true }),
  pattern = all,
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if vim.bo[buf].buftype ~= "" then
      return
    end
    if vim.bo[buf].modifiable and not vim.bo[buf].readonly and vim.bo[buf].modified then
      vim.cmd("silent! update")
      local filename = vim.fn.expand("%:t")
      vim.notify("Saved: " .. filename, vim.log.levels.INFO, {
        title = "Auto Save",
        timeout = 1500
      })
    end
  end,
})
