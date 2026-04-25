if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "kdheepak/cmp-latex-symbols",
  lazy = true,
  specs = {
    {
      "saghen/blink.cmp",
      optional = true,
      dependencies = "kdheepak/cmp-latex-symbols",
      specs = { "saghen/blink.compat", version = "*", lazy = true, opts = {} },
      opts = {
        sources = {
          default = { "latex" },
          providers = {
            latex = { name = "latex_symbols", module = "blink.compat.source", score_offset = -1 },
          },
        },
      },
    },
  },
}
