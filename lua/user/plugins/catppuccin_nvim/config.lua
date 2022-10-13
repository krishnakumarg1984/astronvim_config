vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup {
  -- compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
  transparent_background = false,
  term_colors = true,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    -- percentage = 0.15,
    percentage = 0.20,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    aerial = true,
    cmp = true,
    dap = {
      enabled = true,
      enable_ui = true, -- enable nvim-dap-ui
    },
    gitsigns = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    lsp_trouble = true,
    markdown = true,
    mini = true,
    native_lsp = {
      enabled = true,
    },
    neogit = true,
    neotest = true,
    neotree = true,
    nvimtree = false,
    overseer = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    which_key = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  color_overrides = {},
  custom_highlights = {},
}
-- vim.api.nvim_command "colorscheme catppuccin"
-- require("catppuccin").compile()
