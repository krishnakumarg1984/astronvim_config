return {
  on_attach = function(...) require("inlay-hints").on_attach(...) end,
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
    },
  },
}
