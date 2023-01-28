vim.keymap.set("n", "<leader>qq", "<Plug>(qf_qf_toggle)", { desc = "Toggle quickfix" })
vim.keymap.set("n", "<leader>qs", "<Plug>(qf_qf_switch)", { desc = "Toggle jump quickfix" })
vim.keymap.set("n", "<leader>qS", "<Plug>(qf_qf_toggle_stay)", { desc = "Toggle stay quickfix" })
vim.keymap.set("n", "]q", "<Plug>(qf_qf_next)", { desc = "Next quickfix entry" })
vim.keymap.set("n", "[q", "<Plug>(qf_qf_previous)", { desc = "Prev quickfix entry" })
vim.keymap.set("n", "]l", "<Plug>(qf_loc_next)", { desc = "Next loclist entry" })
vim.keymap.set("n", "[l", "<Plug>(qf_loc_previous)", { desc = "Prev loclist entry" })
-- vim.g.qf_mapping_ack_style = 1
vim.g.qf_nowrap = 0
vim.g.qf_shorten_path = 3