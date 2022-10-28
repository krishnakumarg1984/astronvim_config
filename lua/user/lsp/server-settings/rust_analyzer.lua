-- local rt = require "rust-tools"
return {
  on_attach = function(_, bufnr)
    -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr }) -- Code action groups
    vim.keymap.set("n", "<leader>ra", "<cmd>RustCodeAction<CR>", { buffer = bufnr, desc = "Rust code actions" })
    vim.keymap.set("n", "<leader>rc", "<cmd>RustOpenCargo<CR>", { buffer = bufnr, desc = "Rust open cargo" })
    -- vim.keymap.set("n", "<leader>rh", rt.hover_actions.hover_actions, { buffer = bufnr }) -- Hover actions
    vim.keymap.set("n", "<leader>rd", "<cmd>RustDebuggables<CR>", { buffer = bufnr, desc = "Rust debuggables" })
    vim.keymap.set(
      "n",
      "<leader>rD",
      "<cmd>RustOpenExternalDocs<CR>",
      { buffer = bufnr, desc = "Rust open external docs" }
    )
    vim.keymap.set("n", "<leader>rh", "<cmd>RustHoverActions<CR>", { buffer = bufnr, desc = "Rust hover actions" })
    vim.keymap.set("n", "<leader>rH", "<cmd>RustHoverRange<CR>", { buffer = bufnr, desc = "Rust hover range" })
    vim.keymap.set("n", "<leader>rj", "<cmd>RustJoinLines<CR>", { buffer = bufnr, desc = "Rust join lines" })
    vim.keymap.set("n", "<leader>rM", "<cmd>RustExpandMacro<CR>", { buffer = bufnr, desc = "Rust expand macro" })
    vim.keymap.set("n", "<leader>rmu", "<cmd>RustMoveItemUp<CR>", { buffer = bufnr, desc = "Rust move item up" })
    vim.keymap.set("n", "<leader>rmd", "<cmd>RustMoveItemDown<CR>", { buffer = bufnr, desc = "Rust move item down" })
    vim.keymap.set("n", "<leader>rP", "<cmd>RustParentModule<CR>", { buffer = bufnr, desc = "Rust parent module" })
    vim.keymap.set("n", "<leader>rR", "<cmd>RustRunnables<CR>", { buffer = bufnr, desc = "Rust runnables" })
    vim.keymap.set("n", "<leader>rv", "<cmd>RustViewCrateGraph<CR>", { buffer = bufnr, desc = "Rust crate graph" })
    vim.keymap.set(
      "n",
      "<leader>rw",
      "<cmd>RustReloadWorkspace<CR>",
      { buffer = bufnr, desc = "Rust reload workspace" }
    )
  end,
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
        ignored = { -- https://github.com/numToStr/dotfiles/blob/f972b9ebfd742daac8f2dc5ea6c19681241bd798/neovim/.config/nvim/lua/numToStr/plugins/lsp/servers.lua#L63-L85
          ["async-trait"] = { "async_trait" },
          ["napi-derive"] = { "napi" },
          ["async-recursion"] = { "async_recursion" },
        },
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
