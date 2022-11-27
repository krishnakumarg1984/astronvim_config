require("rust-tools").setup {
  tools = {
    on_initialized = function()
      vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
    end,
  },
  server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
}
