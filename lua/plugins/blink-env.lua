return {
  "bydlw98/blink-cmp-env",
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
