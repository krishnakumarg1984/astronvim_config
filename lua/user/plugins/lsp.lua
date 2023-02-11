return {
  -- "nanotee/sqls.nvim",
  -- {
  --   "jose-elias-alvarez/typescript.nvim",
  --   opts = function() return { server = require("core.utils.lsp").config "tsserver" } end,
  -- },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "cuda", "objc", "objcpp" },
    opts = function() return { server = require("core.utils.lsp").config "clangd" } end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      {
        "kosayoda/nvim-lightbulb", -- VSCode bulb for neovim's built-in LSP.
        -- event = { "CursorHold", "CursorHoldI" },
        config = function()
          require("nvim-lightbulb").setup {
            sign = { enabled = false },
            virtual_text = { enabled = true },
            autocmd = { enabled = true },
          }
        end,
      },

    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      sources = {},
    },
    -- opts = function(_, opts)
    --   local builtins = require("null-ls").builtins
    --   opts.sources = { -- add sources that are local
    --     builtins.formatting.bibclean,
    --   }
    --   return opts
    -- end,
  },
}
