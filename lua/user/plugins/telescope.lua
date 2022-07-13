return {
  -- https://gitlab.com/HiPhish/nvim-config/-/blob/master/plugin/telescope.lua
  defaults = {
    -- winblend = 30,
    -- border = true,
    file_ignore_patterns = {
      "%.zip$",
      "%.tar$",
      "%.tar.gz$",
      "%.so$",
      "%.a$",
      "%.fasl$",
      "%.pyc$",
      "%.whl$",
      "%.bin$",
      "%.db$",
    },
  },
  pickers = {
    diagnostics = { theme = "dropdown" },
    -- diagnostics = { layout = { "vertical" } },
    git_status = { theme = "ivy" },
  },
}
