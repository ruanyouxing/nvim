require('which-key').add {
  {
    '<M-c>r',
    function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest run'
    end,
    desc = 'Run a testcase',
  },
  {
    '<M-c>a',
    desc = 'Add a testcase',
    function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest add_testcase'
    end,
  },
  {
    '<M-c>d',
    desc = 'Delete a testcase',
    function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest delete_testcase'
    end,
  },
  {
    '<M-c>e',
    desc = 'Edit a testcase',
    function()
      pcall(require, 'competitest')
      vim.cmd 'CompetiTest edit_testcase'
    end,
  },
}
