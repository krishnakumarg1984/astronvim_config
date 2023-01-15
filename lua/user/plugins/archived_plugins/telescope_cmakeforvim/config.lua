require("telescope").load_extension "cmake4vim"

vim.keymap.set("n", "<leader>ck", "<cmd>Telescope cmake4vim select_kit<CR>", { desc = "Select kit" })
vim.keymap.set("n", "<leader>cs", "<cmd>Telescope cmake4vim select_target<CR>", { desc = "Select target" })
vim.keymap.set("n", "<leader>cB", "<cmd>Telescope cmake4vim select_build_type<CR>", { desc = "Select build type" })
