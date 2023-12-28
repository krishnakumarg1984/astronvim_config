-- https://github.com/fitrh/init.nvim
return {
  on_attach = function(...)
    require("clangd_extensions.inlay_hints").setup_autocmd()
    -- require("clangd_extensions.inlay_hints").set_inlay_hints()
  end,
  capabilities = {
    offsetEncoding = "utf-8",
    memoryUsageProvider = true,
  },
  filetypes = { "c", "cpp", "cuda", "objc", "objcpp", "proto" },
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
    "--enable-config",
    -- "--cross-file-rename", -- obsolete
    -- "--fallback-style=webkit",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--malloc-trim",
    -- "--suggest-missing-includes", -- obsolete
  },
}
