local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opts = { clear = true }
augroup("LspCodeLens", opts)

return function(client, bufnr)
  if vim.tbl_contains({ "ccls", "clangd", "jsonls", "pylsp", "taplo" }, client.name) then
    astronvim.lsp.disable_formatting(client)
  end

  if client.name == "ccls" then
    client.resolved_capabilities.codeActionProvider = false
    client.resolved_capabilities.completionProvider = false
    client.resolved_capabilities.declarationProvider = false
    client.resolved_capabilities.definitionProvider = false
    client.resolved_capabilities.documentFormattingProvider = false
    client.resolved_capabilities.documentHighlightProvider = false
    client.resolved_capabilities.documentLinkProvider = true
    client.resolved_capabilities.documentOnTypeFormattingProvider = false
    client.resolved_capabilities.documentRangeFormattingProvider = false
    client.resolved_capabilities.documentSymbolProvider = false
    client.resolved_capabilities.executeCommandProvider = false
    client.resolved_capabilities.foldingRangeProvider = false
    client.resolved_capabilities.hoverProvider = false
    client.resolved_capabilities.implementationProvider = false
    client.resolved_capabilities.referencesProvider = false
    client.resolved_capabilities.renameProvider = false
    client.resolved_capabilities.signatureHelpProvider = false
    client.resolved_capabilities.typeDefinitionProvider = false
    client.resolved_capabilities.workspaceSymbolProvider = false
    client.server_capabilities.codeActionProvider = false
    client.server_capabilities.completionProvider = false
    client.server_capabilities.declarationProvider = false
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentHighlightProvider = false
    client.server_capabilities.documentLinkProvider = true
    client.server_capabilities.documentOnTypeFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.documentSymbolProvider = false
    client.server_capabilities.executeCommandProvider = false
    client.server_capabilities.foldingRangeProvider = false
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.implementationProvider = false
    client.server_capabilities.referencesProvider = false
    client.server_capabilities.renameProvider = false
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.typeDefinitionProvider = false
    client.server_capabilities.workspaceSymbolProvider = false
    aucmd("BufWritePost", {
      buffer = bufnr,
      group = "LspCodeLens",
      callback = vim.lsp.codelens.refresh,
      desc = "Refresh codelens on save",
    })
    vim.lsp.codelens.refresh()
    vim.bo[bufnr].tagfunc = ""
    return
  end

  vim.keymap.set("n", "<leader>la", "<cmd>CodeActionMenu<CR>", { buffer = bufnr, desc = "Code Action" })
  -- vim.keymap.del("n", "gd", { buffer = bufnr })
  -- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition(s)", buffer = bufnr })
  vim.keymap.set(
    "n",
    "gr",
    "<cmd>Telescope lsp_references<cr>",
    { desc = "References of current symbol", buffer = bufnr }
  )
  vim.keymap.set("n", "gl", "gl")
  vim.keymap.del("n", "gl")

  -- 'trouble.nvim' keymaps (((

  vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
  vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
  vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
  vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
  vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
  vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>")

  -- )))

  -- 'text-case.nvim' keymaps (((

  vim.cmd [[
      " nnoremap gau :lua require('textcase').lsp_rename('to_upper_case')<CR>
      " nnoremap gal :lua require('textcase').lsp_rename('to_lower_case')<CR>
      nnoremap gaS :lua require('textcase').lsp_rename('to_snake_case')<CR>
      " nnoremap gad :lua require('textcase').lsp_rename('to_dash_case')<CR>
      " nnoremap gan :lua require('textcase').lsp_rename('to_constant_case')<CR>
      " nnoremap ga. :lua require('textcase').lsp_rename('to_dot_case')<CR>
      nnoremap gaA :lua require('textcase').lsp_rename('to_phrase_case')<CR>
      " nnoremap gac :lua require('textcase').lsp_rename('to_camel_case')<CR>
      " nnoremap gap :lua require('textcase').lsp_rename('to_pascal_case')<CR>
      " nnoremap gat :lua require('textcase').lsp_rename('to_title_case')<CR>
      nnoremap gaF :lua require('textcase').lsp_rename('to_path_case')<CR>
      ]]

  -- )))
end

-- https://www.reddit.com/r/neovim/comments/uri2p4/comment/i8ydfti/?utm_source=share&utm_medium=web2x&context=3
-- local diagnostics_active = true
-- local toggle_diagnostics = function()
--   diagnostics_active = not diagnostics_active
--   if diagnostics_active then
--     vim.diagnostic.show()
--   else
--     vim.diagnostic.hide()
--   end
-- end
-- vim.keymap.set("n", "<leader>lt", toggle_diagnostics, { buffer = bufnr, desc = "Toggle diagnostics" })

-- if client.name == "pyright" then
--   require("folding").on_attach()
-- end
