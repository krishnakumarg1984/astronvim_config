require("git-conflict").setup {
  highlights = {
    current = "DiffText",
    incoming = "DiffAdd",
    ancester = "DiffDelete",
  },
}
