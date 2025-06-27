plugin {
  'noib3/nvim-cokeline',
  event = 'ColorScheme',
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    local mappings = require 'cokeline/mappings'
    local errors_fg = get_hex('DiagnosticError', 'fg')
    local warnings_fg = get_hex('DiagnosticWarn', 'fg')
    local hints_fg = get_hex('Diagnostichint', 'fg')
    local red = vim.g.terminal_color_1
    local green = vim.g.terminal_color_2
    local yellow = vim.g.terminal_color_3
    local is_picking_focus = mappings.is_picking_focus
    local is_picking_close = mappings.is_picking_close
    local normal_fg = get_hex('Normal', 'fg')
    local comment_fg = get_hex('Comment', 'fg')
    require('cokeline').setup {
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and normal_fg or comment_fg
        end,
        bg = get_hex('ColorColumn', 'bg'),
      },
      components = {
        {
          text = '',
          fg = get_hex('ColorColumn', 'bg'),
          bg = get_hex('Normal', 'bg'),
        },
        {
          text = ' ',
        },
        {
          text = function(buffer)
            return buffer.index .. '. '
          end,
        },
        {
          text = function(buffer)
            return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. ' ' or buffer.devicon.icon
          end,
          fg = function(buffer)
            return (is_picking_focus() and yellow) or (is_picking_close() and red) or buffer.devicon.color
          end,
          style = function(_)
            return (is_picking_focus() or is_picking_close()) and 'italic,bold' or nil
          end,
        },
        {
          text = function(buffer)
            return buffer.unique_prefix
          end,
          fg = comment_fg,
          style = 'italic',
          truncation = {
            priority = 3,
            direction = 'left',
          },
        },
        {
          text = function(buffer)
            return buffer.filename
          end,
          fg = function(buffer)
            if buffer.is_modified then
              return yellow
            end
            if buffer.diagnostics.errors ~= 0 then
              return red
            end
          end,
          style = function(buffer)
            return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and 'bold,underline')
                or buffer.is_modified and 'italic,bold'
                or buffer.is_focused and 'bold'
                or buffer.diagnostics.errors ~= 0 and 'underline'
                or nil
          end,
        },
        {
          text = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and ' E' .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and ' W' .. buffer.diagnostics.warnings .. ' ')
                or ''
          end,
          fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
          end,
        },
        {
          text = function(buffer)
            return (buffer.diagnostics.hints ~= 0 and ' H' .. buffer.diagnostics.hints) or ''
          end,
          fg = function(buffer)
            return (buffer.diagnostics.hints ~= 0 and hints_fg) or nil
          end,
        },
        {
          text = function(buffer)
            return buffer.is_modified and ' ● ' or '  '
          end,
          fg = function(buffer)
            return buffer.is_modified and green or nil
          end,
          delete_buffer_on_left_click = true,
        },
        {
          text = '|',
          fg = function(buffer)
            return buffer.is_focused and green or nil
          end,
        },
        {
          text = '',
          fg = get_hex('ColorColumn', 'bg'),
          bg = get_hex('Normal', 'bg'),
        },
      },
      sidebar = {
        filetype = 'NvimTree',
        components = {
          {
            text = '  Explorer',
            fg = yellow,
            bg = get_hex('NvimTreeNormal', 'bg'),
            style = 'bold',
          },
        },
      },
    }
  end,
}
