return {
  vim.keymap.set("n", "<leader>rbd", "<cmd>Cbuild<CR>", { desc = "Cargo build (debug)" }),
  vim.keymap.set("n", "<leader>rbr", "<cmd>Cbuild --release<CR>", { desc = "Cargo build (release)" }),
  vim.keymap.set("n", "<leader>rB", "<cmd>Cbench<CR>", { desc = "Cargo bench" }),
  vim.keymap.set("n", "<leader>ro", "<cmd>Cdoc<CR>", { desc = "Cargo doc" }),
  vim.keymap.set("n", "<leader>re", "<cmd>RustExpand<CR>", { desc = "Rust expand" }),
  vim.keymap.set("n", "<leader>rf", "<cmd>RustFmt<CR>", { desc = "Rust format" }),
  vim.keymap.set("n", "<leader>rF", "<cmd>RustFmtRange<CR>", { desc = "Rust format range" }),
  -- vim.keymap.set("n", "<leader>ri", "<cmd>Cinit<CR>", { desc = "Cargo init" }),
  vim.keymap.set("n", "<leader>ri", "<cmd>Cinstall<CR>", { desc = "Cargo install" }),
  vim.keymap.set("n", "<leader>rk", "<cmd>Cargo check<CR>", { desc = "Cargo check" }),
  vim.keymap.set("n", "<leader>rl", "<cmd>Cclean<CR>", { desc = "Cargo clean" }),
  vim.keymap.set("n", "<leader>rn", "<cmd>RustRun<CR>", { desc = "Rust run project" }),
  vim.keymap.set("n", "<leader>rp", "<cmd>RustPlay<CR>", { desc = "Rust play" }),
  vim.keymap.set("n", "<leader>rP", "<cmd>Cpublish<CR>", { desc = "Cargo publish" }),
  vim.keymap.set("n", "<leader>rr", "<cmd>Crun<CR>", { desc = "Cargo run project" }),
  vim.keymap.set("n", "<leader>rs", "<cmd>Csearch<CR>", { desc = "Cargo search" }),
  vim.keymap.set("n", "<leader>rt", "<cmd>Ctest<CR>", { desc = "Cargo test" }),
  vim.keymap.set("n", "<leader>ru", "<cmd>Cupdate<CR>", { desc = "Cargo update" }),
  vim.keymap.set("n", "<leader>rx", "<cmd>Cargo fix --allow-no-vcs<CR>", { desc = "Cargo fix" }),
}
-- :Cruntarget
