-- easily add or disable built in mappings added during LSP attaching
return {
  n = {
    ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
  },
}
