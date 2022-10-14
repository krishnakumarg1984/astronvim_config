-- overrides `require("mason-lspconfig").setup(...)`
local my_ensure_installed = { "clangd" }
if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" == 1 then
  table.insert(my_ensure_installed, "rust_analyzer")
end

return {
  automatic_installation = true,
  ensure_installed = my_ensure_installed,
}
