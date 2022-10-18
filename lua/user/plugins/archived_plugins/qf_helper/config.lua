require("qf_helper").setup {
  prefer_loclist = false, -- Used for QNext/QPrev (see Commands below)
  quickfix = {
    min_height = 5, -- Min qf height when using open() or toggle()
  },
}
