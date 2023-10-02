if vim.g.vscode then
  vim.cmd[[source ~/.config/nvim/lua/vscode/init.vim ]]
else
  require 'core'
end
