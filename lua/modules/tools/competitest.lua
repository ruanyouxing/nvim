plugin {
  'xeluxee/competitest.nvim',
  config = function()
    require('competitest').setup {
      runner_ui = {
        interface = 'split',
        show_nu = false,
        selector_show_nu = false,
      },
      split_ui = {
        total_width = 0.35,
        vertical_layout = {
          { 1, 'tc' },
          { 1, { { 1, 'si' }, { 1, 'eo' } } },
          { 1, { { 1, 'so' }, { 1, 'se' } } },
        },
      },
      editor_ui = {
        show_nu = false,
      },
      testcases_single_file_format = '.$(FNOEXT)_task$(TCNUM).tc',
      testcases_input_file_format = '.$(FNOEXT)_case$(TCNUM).inp',
      testcases_output_file_format = '.$(FNOEXT)_case$(TCNUM).out',
    }
  end,
  lazy = true,
  cmd = { 'CompetiTestRun', 'CompetiTestAdd', 'CompetiTestDelete', 'CompetiTestEdit' },
}
