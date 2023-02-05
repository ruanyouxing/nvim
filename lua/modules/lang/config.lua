local lang = {}

function lang.headlines()
  require('headlines').setup {}
end

function lang.filetypes()
  vim.g.did_load_filetypes = 1
  require('filetype').setup {
    overrides = {
      extensions = {
        rasi = 'css',
        zsh = 'bash',
      },
      complex = {
        ['.*git/config'] = 'gitconfig',
      },
      shebang = {
        dash = 'sh',
      },
      function_extensions = {
        ['cpp'] = function()
          vim.bo.filetype = 'cpp'
          vim.bo.cinoptions = vim.bo.cinoptions .. 'L0'
        end,
        ['pdf'] = function()
          vim.bo.filetype = 'pdf'
          vim.fn.jobstart('zathura ' .. '"' .. vim.fn.expand '%' .. '"')
        end,
      },
    },
  }
end

return lang
