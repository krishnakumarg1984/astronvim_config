-- https://github.com/fitrh/init.nvim
return {
  capabilities = {
    offsetEncoding = "utf-8",
    -- offsetEncoding = "utf-32",
    memoryUsageProvider = true,
  },
  filetypes = { "c", "cpp", "cuda", "objc", "objcpp", "opencl" },
  init_options = {
    clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
    -- TODO: figure out what is this
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  cmd = {
    "clangd",
    -- SEE: clangd --help-hidden for possible options
    -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
    -- to add more `checks`, create  a `.clang-tidy` file in the root directory
    -- SEE: https://clang.llvm.org/extra/clang-tidy
    "--all-scopes-completion",
    "--background-index",
    "--clang-tidy",
    -- "--completion-style=bundled",
    "--completion-style=detailed",
    "--cross-file-rename",
    "--fallback-style=webkit",
    "--header-insertion=iwyu",
    "--suggest-missing-includes",
    -- "--offset-encoding=utf-8",
  },
}
