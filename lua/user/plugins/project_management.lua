return {
  "ahmedkhalf/project.nvim", --  The superior project management solution for neovim.
  -- event = "VeryLazy",
  lazy = false,
  opts = {
    -- ignore_lsp = { "lua_ls" },
    detection_methods = { "pattern" },
    patterns = {
      ".bzr",
      ".git",
      ".hg",
      ".root",
      ".svn",
      "_darcs",
      "Cargo.lock",
      -- "Cargo.toml",
      "Makefile",
      "package.json",
    },
    ignore_lsp = { "lua_ls", "julials" },
    silent_chdir = false,
  },
  config = function(_, opts) require("project_nvim").setup(opts) end,
}
