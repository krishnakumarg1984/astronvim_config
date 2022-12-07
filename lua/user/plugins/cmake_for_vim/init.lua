return {
  ft = { "c", "cmake", "cpp", "cuda", "objc", "objcpp", "CMakePresets.json" },
  event = { "BufEnter CMakePresets.json", "BufEnter CMakeUserPresets.json" },
  setup = function() require "user.plugins.cmake_for_vim.setup" end,
  config = function() require "user.plugins.cmake_for_vim.config" end,
}
