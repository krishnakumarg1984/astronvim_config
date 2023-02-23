return {
  "simrat39/rust-tools.nvim", -- Tools for better development in rust using neovim's builtin lsp
  ft = { "rust" },
  opts = function()
    local codelldb_dir = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/"
    local codelldb_executable_path = codelldb_dir .. "adapter/codelldb"
    local liblldb_path = codelldb_dir .. "lldb/lib/liblldb.so"
    return {
      -- tools = {
      --   inlay_hints = {
      --     parameter_hints_prefix = "  ",
      --     other_hints_prefix = "  ",
      --   },
      -- },
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_executable_path, liblldb_path),
      },
      server = require("core.utils.lsp").config "rust_analyzer",
    }
  end,
  -- config = function()
  --   require("rust-tools").setup {
  --     tools = {
  --       -- on_initialized = function()
  --       --   vim.cmd [[
  --       --     autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
  --       --   ]]
  --       -- end,
  --       -- inlay_hints = { auto = false },
  --     },
  --     -- server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
  --   }
  -- end,
}
