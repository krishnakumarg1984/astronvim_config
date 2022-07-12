require("neogen").setup {
  snippet_engine = "luasnip",
  languages = {
    ruby = { template = { annotation_convention = "tomdoc" } },
    python = { template = { annotation_convention = "google_docstrings" } },
    typescript = { template = { annotation_convention = "tsdoc" } },
    typescriptreact = { template = { annotation_convention = "tsdoc" } },
  },
}
