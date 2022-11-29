local ih = require "inlay-hints"

require("rust-tools").setup {
  tools = {
    on_initialized = function()
      ih.set_all()
      vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
    end,
    inlay_hints = {
      auto = false,
    },
  },
  server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
  -- server = {
  --   on_attach = function(c, b) ih.on_attach(c, b) end,
  -- },
}
