require("cmake-tools").setup {
  cmake_command = "cmake",
  cmake_build_directory = "build",
  cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_options = {},
  cmake_console_size = 10, -- cmake output window height
  cmake_show_console = "always", -- "always", "only_on_error"
  cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" }, -- dap configuration, optional
  cmake_dap_open_command = require("dap").repl.open, -- optional
  cmake_variants_message = {
    short = { show = true },
    long = { show = true, max_length = 40 },
  },
}
vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "Build" })
vim.keymap.set("n", "<leader>cc", "<cmd>CMakeClean<CR>", { desc = "Clean target" })
vim.keymap.set("n", "<leader>cd", "<cmd>CMakeDebug<CR>", { desc = "Debug" })
vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", { desc = "Generate" })
vim.keymap.set("n", "<leader>ci", "<cmd>CMakeInstall<CR>", { desc = "Install targets" })
vim.keymap.set("n", "<leader>ck", "<cmd>CMakeStop<CR>", { desc = "Stop cmake process" })
vim.keymap.set("n", "<leader>cl", "<cmd>CMakeSelectLaunchTarget<CR>", { desc = "Select launch target" })
vim.keymap.set("n", "<leader>co", "<cmd>CMakeOpen<CR>", { desc = "Open console" })
vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<CR>", { desc = "Run" })
vim.keymap.set("n", "<leader>cs", "<cmd>CMakeSelectBuildType<CR>", { desc = "Select build type" })
vim.keymap.set("n", "<leader>ct", "<cmd>CMakeSelectBuildTarget<CR>", { desc = "Select build target" })
vim.keymap.set("n", "<leader>cz", "<cmd>CMakeClose<CR>", { desc = "Close console" })
