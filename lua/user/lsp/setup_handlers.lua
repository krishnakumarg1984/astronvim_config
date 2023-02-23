-- override the LSP setup handler function based on server name

local function lsp_plugin_setup(plugin, server, opts)
  local lsp_plugin_avail, _ = pcall(require, plugin)
  if not lsp_plugin_avail then require("lspconfig")[server].setup(opts) end
end

return {
  tsserver = function(...) lsp_plugin_setup("typescript", ...) end,
  clangd = function(...) lsp_plugin_setup("clangd_extensions", ...) end,
  -- rust_analyzer = function(_, opts)
  --   require("rust-tools").setup {
  --     server = opts,
  --     tools = {
  --       inlay_hints = {
  --         parameter_hints_prefix = "  ",
  --         other_hints_prefix = "  ",
  --       },
  --     },
  --   }
  -- end,
}

-- return {
-- -- first function changes the default setup handler
-- function(server, opts) require("lspconfig")[server].setup(opts) end,
-- -- keys for a specific server name will be used for that LSP
-- tsserver = function(_, opts) require("typescript").setup { server = opts } end,
-- clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
-- lua_ls = function(server, opts)
--   -- custom lua_ls setup handler
--   require("lspconfig")["lua_ls"].setup(opts)
-- end,
-- }
