local iron = require "iron.core"
iron.setup {
  config = {
    highlight_last = "IronLastSent", -- Highlights the last sent block with bold
    should_map_plug = true, -- If iron should expose `<plug>(...)` mappings for the plugins
    scratch_repl = true, -- Whether a repl should be discarded or not
    close_window_on_exit = true, -- Automatically closes the repl window on process end
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        command = { "zsh" },
      },
      python = require("iron.fts.python").ipython,
      -- forcing a default
    },
    -- repl_open_cmd = require("iron.view").curry.right(60),
    -- repl_open_cmd = "belowright 15 split",
    -- repl_open_cmd = "belowright 60 vsplit",
    -- Alternatively, pass a function, which is evaluated when a repl is open.
    repl_open_cmd = require("iron.view").curry.right(function() return vim.o.columns / 2 end),
    -- how the REPL window will be opened, the default is opening a float window of height 40 at the bottom.
    buflisted = false, -- If the repl buffer is listed
  },
}
