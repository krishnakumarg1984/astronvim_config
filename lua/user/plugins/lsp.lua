return {
  "nanotee/sqls.nvim",
  { "jose-elias-alvarez/typescript.nvim", opts = function() return { server = astronvim.lsp.config "tsserver" } end },
  { "p00f/clangd_extensions.nvim", opts = function() return { server = astronvim.lsp.config "clangd" } end },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
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
