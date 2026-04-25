if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  ---@module "catppuccin"
  ---@type CatppuccinOptions
  opts = {
    dim_inactive = { enabled = true, percentage = 0.25 },
    float = { solid = true, transparent = false },
    default_integrations = false,
    auto_integrations = true,
    integrations = {
      illuminate = { lsp = true },
      native_lsp = { inlay_hints = { background = false } },
    },
    custom_highlights = {
      -- disable italics  for treesitter highlights
      LspInlayHint = { style = { "italic" } },
      UfoFoldedEllipsis = { link = "UfoFoldedFg" },
      ["@parameter"] = { style = {} },
      ["@type.builtin"] = { style = {} },
      ["@namespace"] = { style = {} },
      ["@text.uri"] = { style = { "underline" } },
      ["@tag.attribute"] = { style = {} },
      ["@tag.attribute.tsx"] = { style = {} },
    },
  },
}
