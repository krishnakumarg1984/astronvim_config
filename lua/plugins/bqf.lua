if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  opts = {
    preview = { auto_preview = false },
    func_map = {
      split = "-",
      vsplit = "|",
    },
  },
}
