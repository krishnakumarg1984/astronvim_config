-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "wintermute-cell/gitignore.nvim", -- A neovim plugin for generating .gitignore files.
    cmd = { "Gitignore" },
  },
  {
    "sitiom/nvim-numbertoggle", -- Neovim plugin to automatically toggle between relative and absolute line numbers. Written in Lua.
    event = "User AstroFile",
  },
  -- {
  --   "jghauser/mkdir.nvim", -- This neovim plugin creates missing folders on save
  --   event = "BufWritePre",
  -- },
}
