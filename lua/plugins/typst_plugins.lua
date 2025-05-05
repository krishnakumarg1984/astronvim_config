return {
  {
    "kaarmu/typst.vim",
    ft = { "typst" },
    init = function() vim.g.typst_pdf_viewer = "zathura" end,
  },
  {
    "chomosuke/typst-preview.nvim",
    cmd = { "TypstPreview", "TypstPreviewToggle", "TypstPreviewUpdate" },
    build = function() require("typst-preview").update() end,
    opts = {
      dependencies_bin = {
        tinymist = "tinymist",
      },
    },
  },
}
