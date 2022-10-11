-- vim: ft=lua:
return {
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importEnforceGranularity = true,
        importPrefix = "crate",
      },
      cargo = {
        allFeatures = true,
        features = "all",
        loadOutDirsFromCheck = true,
      },
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
        -- overrideCommand = "nag",
        -- overrideCommand = { "cargo", "clippy", "--message-format=json" },
        overrideCommand = {
          "cargo",
          "clippy",
          "--message-format=json",
          "--",
          "-D",
          "clippy::all",
          "-W",
          "clippy::pedantic",
          "-W",
          "clippy::nursery",
          -- "-W",
          -- "clippy::cargo",
          "-W",
          "clippy::unwrap_used",
          "-W",
          "clippy::expect_used",
          -- "-W",
          -- "clippy::restriction",
        },
        -- extraArgs = { "--no-deps" },
      },
      inlayHints = {
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true,
        },
      },
      procMacro = {
        enable = true,
      },
      experimental = {
        procAttrMacros = true,
      },
    },
  },
}
-- completion = {
--   callable = {
--     snippets = "fill_arguments",
--   },
-- },
