if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "yarospace/lua-console.nvim",
  lazy = true,
  keys = {
    { "`", desc = "Lua-console - toggle" },
    { "<Leader>`", desc = "Lua-console - attach to buffer" },
  },
  opts = {},
}
