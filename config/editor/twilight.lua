local cfg = {
  dimming = {
    alpha = 0.25, -- amount of dimming
    color = { "Normal", "#ffffff" },
    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  },
  context = 10, -- amount of lines we will try to show around the current line
  treesitter = true,  
  expand = {   
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {},
}

require('twilight').setup(cfg)
