if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h15"
  vim.api.nvim_set_current_dir("C:\\Users\\hungz\\")
    vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true }) -- Select line(s) in visual mode and copy (CTRL+Shift+V)
  vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+p', { noremap = true }) -- Paste in insert mode (CTRL+Shift+C)
  vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true }) -- Paste in normal mode (CTRL+Shift+C)
end

