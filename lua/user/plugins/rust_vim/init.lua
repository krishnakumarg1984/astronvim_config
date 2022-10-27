return {
  vim.keymap.set("n", "<leader>re", "<cmd>RustExpand<CR>", { desc = "Rust expand" }),
  vim.keymap.set("n", "<leader>rf", "<cmd>RustFmt<CR>", { desc = "Rust format" }),
  vim.keymap.set("n", "<leader>rF", "<cmd>RustFmtRange<CR>", { desc = "Rust format range" }),
  vim.keymap.set("n", "<leader>rp", "<cmd>RustPlay<CR>", { desc = "Rust play" }),
  vim.keymap.set("n", "<leader>rr", "<cmd>RustRun<CR>", { desc = "Rust run project" }),
  vim.keymap.set("n", "<leader>rr", "<cmd>Cargo run<CR>", { desc = "Cargo run project" }),
}
