return {
  ft = { "c", "cmake", "cpp", "cuda", "objc", "objcpp" },
  event = { "BufEnter CMakePresets.json", "BufEnter CMakeUserPresets.json" },
  config = function() require "user.plugins.cmake_tools.config" end,
}
-- cmd = {
--   "CMakeBuild",
--   "CMakeClean",
--   "CMakeClose",
--   "CMakeDebug",
--   "CMakeGenerate!",
--   "CMakeGenerate",
--   "CMakeInstall",
--   "CMakeOpen",
--   "CMakeRun",
--   "CMakeSelectBuildTarget",
--   "CMakeSelectBuildType",
--   "CMakeSelectLaunchTarget",
--   "CMakeStop",
-- },