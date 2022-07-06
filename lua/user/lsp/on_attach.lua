return function(client, bufnr)
  if vim.tbl_contains({ "clangd", "taplo", "pylsp" }, client.name) then
    astronvim.lsp.disable_formatting(client)
  end

  -- if client.name == "pyright" then
  --   require("folding").on_attach()
  -- end
end
