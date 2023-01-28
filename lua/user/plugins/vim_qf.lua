-- vim.g.qf_mapping_ack_style = 1
vim.g.qf_nowrap = 0
vim.g.qf_shorten_path = 3
return {
  "romainl/vim-qf", -- Tame the quickfix window.
  ft = { "qf" },
  event = { "QuickFixCmdPost", "QuickFixCmdPre" },
  keys = {
    { "<leader>qq", "<Plug>(qf_qf_toggle)", desc = "Toggle quickfix" },
    { "<leader>qs", "<Plug>(qf_qf_switch)", desc = "Toggle jump quickfix" },
    { "<leader>qS", "<Plug>(qf_qf_toggle_stay)", desc = "Toggle stay quickfix" },
    { "]q", "<Plug>(qf_qf_next)", desc = "Next quickfix entry" },
    { "[q", "<Plug>(qf_qf_previous)", desc = "Prev quickfix entry" },
    { "]l", "<Plug>(qf_loc_next)", desc = "Next loclist entry" },
    { "[l", "<Plug>(qf_loc_previous)", desc = "Prev loclist entry" },
  },
}
