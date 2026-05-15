return {
  'romgrk/nvim-treesitter-context',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    enable = true,
    throttle = true,
    max_lines = 0,
    patterns = {
      default = {
        'class',
        'function',
        'method',
        'for',
        'while',
        'if',
        'switch',
        'case',
      },
    },
    exact_patterns = {},
  }
}
