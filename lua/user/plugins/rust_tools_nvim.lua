return {
  "simrat39/rust-tools.nvim", -- Tools for better development in rust using neovim's builtin lsp
  ft = { "rust" },
  opts = function() return { server = require("core.utils.lsp").config "rust_analyzer" } end,
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
