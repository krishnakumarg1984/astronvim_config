require("sniprun").setup {
  -- selected_interpreters = { "Python3_jupyter" },
  selected_interpreters = { "Python3_fifo" },
  --# you can combo different display modes as desired
  display = {
    -- "Classic", --# display results in the command-line  area
    -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
    "VirtualTextErr", --# display error results as virtual text
    -- "TempFloatingWindow", --# display results in a floating window
    "LongTempFloatingWindow", --# same as above, but only long results. To use with VirtualText__
    -- "Terminal",                --# display results in a vertical split
    -- "TerminalWithCode",        --# display results and code history in a vertical split
    -- "NvimNotify",              --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  },
  repl_enable = {
    "Python3_fifo",
    "Bash_original",
    "Julia_jupyter",
    "GFM_original",
    "Mathematica_original",
    "R_original",
    "Sage_fifo",
  },
  -- borders = "none",
  -- borders = "shadow",
  -- interpreter_options = {
  --   Python3_fifo = {
  --     intepreter = "python3.9",
  --     venv = { "venv_project1", "venv_project2", "../venv_project2" },
  --   },
  -- },
}
