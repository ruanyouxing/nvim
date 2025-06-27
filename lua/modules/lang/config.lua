local lang = {}

function lang.headlines()
  require('headlines').setup {}
end

function lang.markdown_render()
  require('render-markdown').setup {}
end

function lang.clangd_setup()
  require('clangd_extensions').setup {
    extensions = {
      autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
        only_current_line = false,
        only_current_line_autocmd = 'CursorHold',
        show_parameter_hints = true,
        parameter_hints_prefix = '<- ',
        other_hints_prefix = '=> ',
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = 'Comment',
        priority = 100,
      },
      ast = {
        role_icons = {
          type = '',
          declaration = '',
          expression = '',
          specifier = '',
          statement = '',
          ['template argument'] = '',
        },
        {
          Compound = '',
          Recovery = '',
          TranslationUnit = '',
          PackExpansion = '',
          TemplateTypeParm = '',
          TemplateTemplateParm = '',
          TemplateParamObject = '',
        },
        highlights = {
          detail = 'Comment',
        },
        memory_usage = {
          border = 'rounded',
        },
        symbol_info = {
          border = 'rounded',
        },
      },
    },
  }
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

function lang.trouble()
  require('trouble').setup {
    position = 'bottom',
    height = 6,
    width = 50,
    mode = 'workspace_diagnostics',
    fold_open = '',
    fold_closed = '',
    group = true,
    padding = true,
    action_keys = {
      close = 'q',
      cancel = '<esc>',
      refresh = 'r',
      jump = { '<cr>', '<tab>' },
      open_split = { '<c-x>' },
      open_vsplit = { '<c-v>' },
      open_tab = { '<c-t>' },
      jump_close = { 'o' },
      toggle_mode = 'm',
      toggle_preview = 'P',
      hover = 'K',
      preview = 'p',
      close_folds = { 'zM', 'zm' },
      open_folds = { 'zR', 'zr' },
      toggle_fold = { 'zA', 'za' },
      previous = 'k',
      next = 'j',
    },
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = { 'lsp_definitions' },
    signs = {
      error = '',
      warning = '',
      hint = '',
      information = '',
      other = '﫠',
    },
    use_diagnostic_signs = true,
  }
end

return lang
