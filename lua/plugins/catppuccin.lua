-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "catppuccin/nvim",
  -- enabled = false,
  name = "catppuccin",
  ---@type CatppuccinOptions
  opts = {
    dim_inactive = { enabled = true, percentage = 0.25 },
    default_integrations = false,
    integrations = {
      aerial = true,
      blink_cmp = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      illuminate = { enabled = true, lsp = true },
      indent_blankline = true,
      markdown = true,
      mason = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = { background = false },
      },
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = { enabled = true, style = "nvchad" },
      treesitter = true,
      ufo = true,
      which_key = true,
      window_picker = true,
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
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- signcolumn = false,
      numhl = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },
}
