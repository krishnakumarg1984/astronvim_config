-- https://neovim.discourse.group/t/how-to-get-number-of-processors-in-linux-with-lua-api/1943
-- if vim.fn.has("win32") > 0 then
--     u.num_of_processers = vim.env.NUMBER_OF_PROCESSORS
-- elseif fn.has("unix") > 0 then
--     u.num_of_processers = 4 -- os.execute("nproc") return wrong value
-- end
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
  vim.keymap.set("n", "<leader>ctt", "<Plug>(CTest)", { desc = "CTest" }),
  vim.keymap.set("n", "<leader>ctc", "<Plug>(CTestCurrent)", { desc = "CTest (current target)" }),
  vim.keymap.set("n", "<leader>cto", "<cmd>CTest --output-on-failure<CR>", { desc = "CTest (output on failure)" }),
  vim.keymap.set("n", "<leader>ctv", "<cmd>CTest --verbose<CR>", { desc = "CTest (verbose)" }),
  vim.keymap.set(
    "n",
    "<leader>ctV",
    "<cmd>CTest --verbose --output-on-failure<CR>",
    { desc = "CTest (verbose + output on failure)" }
  ),
  vim.keymap.set(
    "n",
    "<leader>ctr",
    "<cmd>CTest --rerun-failed --output-on-failure<CR>",
    { desc = "CTest (rerun failed)" }
  ),
}
