return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = true,
      indent = {
        hl = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
      },
      scope = {
        enabled = true,
      },
      filter = function(buf)
        local bo = vim.bo[buf]
        local exclude_filetypes = {
          ["log"] = true,
          ["fugitive"] = true,
          ["gitcommit"] = true,
          ["vimwiki"] = true,
          ["markdown"] = true,
          ["txt"] = true,
          ["vista"] = true,
          ["help"] = true,
          ["todoist"] = true,
          ["NvimTree"] = true,
          ["peekaboo"] = true,
          ["git"] = true,
          ["TelescopePrompt"] = true,
          ["undotree"] = true,
          ["flutterToolsOutline"] = true,
          ["lspinfo"] = true,
          ["neo-tree"] = true,
        }

        local exclude_buftypes = {
          ["terminal"] = true,
          ["nofile"] = true,
          ["quickfix"] = true,
          ["prompt"] = true,
        }

        if exclude_filetypes[bo.filetype] or exclude_buftypes[bo.buftype] then
          return false
        end
        return true
      end,
    },
  },

}
