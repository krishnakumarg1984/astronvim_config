return {
  "Dhanus3133/LeetBuddy.nvim",
  -- config = function()
  --   require("leetbuddy").setup {}
  -- end,
  keys = {
    { "<leader>Lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
    { "<leader>Ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
    { "<leader>Lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
    { "<leader>Lt", "<cmd>LBTest<cr>", desc = "Run Code" },
    { "<leader>Ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
  },
}
