return {
  require "telescope",
  vim.keymap.set("n", "<leader>cb", "<Plug>(CMakeBuild)", { desc = "Build current project" }),
  vim.keymap.set("n", "<leader>cc", "<Plug>(CMakeCompileSource)", { desc = "Compile buffer source" }),
  vim.keymap.set("n", "<leader>cg", "<Plug>(CMake)", { desc = "Generate" }),
  vim.keymap.set("n", "<leader>cG", "<Plug>(CMakeResetAndReload)", { desc = "Reset & generate" }),
  vim.keymap.set("n", "<leader>ci", "<Plug>(CMakeInfo)", { desc = "Show cmake info" }),
  vim.keymap.set("n", "<leader>cl", "<Plug>(CMakeClean)", { desc = "Clean project" }),
  vim.keymap.set("n", "<leader>cm", "<cmd>CCMake tab<CR>", { desc = "Console cmake" }),
  vim.keymap.set("n", "<leader>cR", "<Plug>(CMakeReset)", { desc = "Remove build dir" }),
  vim.keymap.set("n", "<leader>cr", "<Plug>(CMakeRun)", { desc = "Run binary of current target" }),
  vim.keymap.set("n", "<leader>cT", "<Plug>(CTest)", { desc = "CTest (with args)" }),
  vim.keymap.set("n", "<leader>ct", "<Plug>(CTestCurrent)", { desc = "CTest (current target)" }),
}
