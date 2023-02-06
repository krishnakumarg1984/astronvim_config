return {
  "danymat/neogen", -- A better annotation generator. Supports multiple languages and annotation conventions.
  cmd = { "Neogen", "Neogen func", "Neogen class", "Neogen file", "Neogen type" },
  keys = {
    { "<leader>nc", "<cmd>Neogen class<CR>", desc = "Class annotation" },
    { "<leader>nf", "<cmd>Neogen func<CR>", desc = "Func annotation" },
    { "<leader>ni", "<cmd>Neogen file<CR>", desc = "File annotation" },
    { "<leader>nn", "<cmd>Neogen<CR>", desc = "Generate annotation" },
    { "<leader>nt", "<cmd>Neogen type<CR>", desc = "Type annotation" },
  },
  opts = {
    snippet_engine = "luasnip",
    languages = {
      bash = { template = { annotation_convention = "google_bash" } },
      c = { template = { annotation_convention = "doxygen" } },
      cpp = { template = { annotation_convention = "doxygen" } },
      go = { template = { annotation_convention = "godoc" } },
      java = { template = { annotation_convention = "javadoc" } },
      javascript = { template = { annotation_convention = "jsdoc" } },
      javascriptreact = { template = { annotation_convention = "jsdoc" } },
      lua = { template = { annotation_convention = "ldoc" } },
      python = { template = { annotation_convention = "google_docstrings" } },
      ruby = { template = { annotation_convention = "tomdoc" } },
      rust = { template = { annotation_convention = "rustdoc" } },
      typescript = { template = { annotation_convention = "tsdoc" } },
      typescriptreact = { template = { annotation_convention = "tsdoc" } },
    },
  },
}
