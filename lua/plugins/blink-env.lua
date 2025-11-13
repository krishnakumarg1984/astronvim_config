if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "bydlw98/blink-cmp-env",
  enabled = false,
  lazy = true,
  specs = {
    {
      "Saghen/blink.cmp",
      optional = true,
      opts = {
        sources = {
          default = { "env" },
          providers = {
            env = { name = "Env", module = "blink-cmp-env" },
          },
        },
      },
    },
  },
}
