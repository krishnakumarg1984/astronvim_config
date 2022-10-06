return {
  capabilities = {
    offsetEncoding = "utf-8",
    -- offsetEncoding = "utf-32",
    memoryUsageProvider = true,
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "opencl" },
  init_options = {
    clangdFileStatus = true,
  },
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
    "--all-scopes-completion",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--suggest-missing-includes",
    "--fallback-style=webkit",
    "--cross-file-rename",
    -- "--offset-encoding=utf-8",
  },
}
