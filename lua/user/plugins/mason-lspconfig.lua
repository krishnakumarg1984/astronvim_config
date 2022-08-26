-- overrides `require("mason-lspconfig").setup(...)`
return {
  automatic_installation = true,
  ensure_installed = { "clangd" },
}
