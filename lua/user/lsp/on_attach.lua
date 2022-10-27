-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2
-- add to the global LSP on_attach function
return function(client, bufnr)
  -- if vim.tbl_contains({ "ccls", "clangd", "jsonls", "pylsp", "taplo" }, client.name) then
  --   astronvim.lsp.disable_formatting(client)
  -- end

  -- rust plugin mappings (((

  if client.name == "rust_analyzer" or client.name == "rust_analyzer-standalone" then
    vim.keymap.set("n", "<leader>ra", "<cmd>RustCodeAction<CR>", { buffer = bufnr, desc = "Rust code actions" })
    vim.keymap.set("n", "<leader>rc", "<cmd>RustOpenCargo<CR>", { buffer = bufnr, desc = "Rust open cargo" })
    vim.keymap.set("n", "<leader>rc", "<cmd>RustOpenCargo<CR>", { buffer = bufnr, desc = "Rust open cargo" })
    vim.keymap.set("n", "<leader>rd", "<cmd>RustDebuggables<CR>", { buffer = bufnr, desc = "Rust debuggables" })
    vim.keymap.set(
      "n",
      "<leader>rD",
      "<cmd>RustOpenExternalDocs<CR>",
      { buffer = bufnr, desc = "Rust open external docs" }
    )
    vim.keymap.set("n", "<leader>re", "<cmd>RustExpand<CR>", { buffer = bufnr, desc = "Rust expand" })
    vim.keymap.set("n", "<leader>rf", "<cmd>RustFmt<CR>", { buffer = bufnr, desc = "Rust format" })
    vim.keymap.set("n", "<leader>rF", "<cmd>RustFmtRange<CR>", { buffer = bufnr, desc = "Rust format range" })
    vim.keymap.set("n", "<leader>rh", "<cmd>RustHoverActions<CR>", { buffer = bufnr, desc = "Rust hover actions" })
    vim.keymap.set("n", "<leader>rH", "<cmd>RustHoverRange<CR>", { buffer = bufnr, desc = "Rust hover range" })
    vim.keymap.set("n", "<leader>rj", "<cmd>RustJoinLines<CR>", { buffer = bufnr, desc = "Rust join lines" })
    vim.keymap.set("n", "<leader>rM", "<cmd>RustExpandMacro<CR>", { buffer = bufnr, desc = "Rust expand macro" })
    vim.keymap.set("n", "<leader>rmd", "<cmd>RustMoveItemDown<CR>", { buffer = bufnr, desc = "Rust move item down" })
    vim.keymap.set("n", "<leader>rmu", "<cmd>RustMoveItemUp<CR>", { buffer = bufnr, desc = "Rust move item up" })
    vim.keymap.set("n", "<leader>rP", "<cmd>RustParentModule<CR>", { buffer = bufnr, desc = "Rust parent module" })
    vim.keymap.set("n", "<leader>rp", "<cmd>RustPlay<CR>", { buffer = bufnr, desc = "Rust play" })
    -- vim.keymap.set("n", "<leader>rr", "<cmd>RustRun<CR>", { buffer = bufnr, desc = "Rust run project" })
    vim.keymap.set("n", "<leader>rr", "<cmd>Cargo run<CR>", { buffer = bufnr, desc = "Cargo run project" })
    vim.keymap.set("n", "<leader>rR", "<cmd>RustRunnables<CR>", { buffer = bufnr, desc = "Rust runnables" })
    vim.keymap.set("n", "<leader>rv", "<cmd>RustViewCrateGraph<CR>", { buffer = bufnr, desc = "Rust crate graph" })
    vim.keymap.set(
      "n",
      "<leader>rw",
      "<cmd>RustReloadWorkspace<CR>",
      { buffer = bufnr, desc = "Rust reload workspace" }
    )
  end

  -- )))

  -- 'text-case.nvim' keymaps (((

  vim.keymap.set(
    { "n", "v", "o" },
    "gaA",
    "<cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>",
    { desc = "LSP rename to phrase_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaF",
    "<cmd>lua require('textcase').lsp_rename('to_path_case')<CR>",
    { desc = "LSP rename to path_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaS",
    "<cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>",
    { desc = "LSP rename to snake_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaT",
    "<cmd>lua require('textcase').lsp_rename('to_title_case')<CR>",
    { desc = "LSP rename to title_case" }
  )
  vim.keymap.set(
    { "n", "v", "o" },
    "gaZ",
    "<cmd>lua require('textcase').lsp_rename('to_dot_case')<CR>",
    { desc = "LSP rename to dot_case" }
  )

  -- )))
end
