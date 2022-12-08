-- local rt = require "rust-tools"
return {
  on_attach = function(_, bufnr)
    -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr }) -- Code action groups
    -- vim.keymap.set("n", "<leader>ri", "<cmd>Cinit<CR>", { desc = "Cargo init" })
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
    vim.keymap.set("n", "<leader>rbd", "<cmd>Cbuild<CR>", { desc = "Cargo build (debug)" })
    vim.keymap.set("n", "<leader>rbr", "<cmd>Cbuild --release<CR>", { desc = "Cargo build (release)" })
    vim.keymap.set("n", "<leader>rB", "<cmd>Cbench<CR>", { desc = "Cargo bench" })
    vim.keymap.set("n", "<leader>ro", "<cmd>Cdoc --open<CR>", { desc = "Cargo doc" })
    vim.keymap.set("n", "<leader>re", "<cmd>RustExpand<CR>", { desc = "Rust expand" })
    vim.keymap.set("n", "<leader>rf", "<cmd>RustFmt<CR>", { desc = "Rust format" })
    vim.keymap.set("n", "<leader>rF", "<cmd>RustFmtRange<CR>", { desc = "Rust format range" })
    vim.keymap.set("n", "<leader>rg", "<cmd>Cargo modules generate tree<CR>", { desc = "Generate module tree" })
    vim.keymap.set("n", "<leader>ri", "<cmd>Cinstall<CR>", { desc = "Cargo install" })
    vim.keymap.set("n", "<leader>rk", "<cmd>Cargo check<CR>", { desc = "Cargo check" })
    vim.keymap.set("n", "<leader>rl", "<cmd>Cclean<CR>", { desc = "Cargo clean" })
    vim.keymap.set("n", "<leader>rn", "<cmd>RustRun<CR>", { desc = "Rust run project" })
    vim.keymap.set("n", "<leader>rp", "<cmd>RustPlay<CR>", { desc = "Rust play" })
    vim.keymap.set("n", "<leader>rP", "<cmd>Cpublish<CR>", { desc = "Cargo publish" })
    vim.keymap.set("n", "<leader>rr", "<cmd>Crun<CR>", { desc = "Cargo run project" })
    vim.keymap.set("n", "<leader>rs", "<cmd>Csearch<CR>", { desc = "Cargo search" })
    vim.keymap.set("n", "<leader>rt", "<cmd>Ctest<CR>", { desc = "Cargo test" })
    vim.keymap.set("n", "<leader>ru", "<cmd>Cupdate<CR>", { desc = "Cargo update" })
    vim.keymap.set("n", "<leader>rx", "<cmd>Cargo fix --allow-no-vcs<CR>", { desc = "Cargo fix" })
  end,
  settings = {
    ["rust-analyzer"] = {
      lens = {
        enable = true,
      },
      assist = {
        importEnforceGranularity = true,
        importPrefix = "crate",
        wrap_return_type_in_result = false,
        generate_enum_is_method = false,
      },
      codeAction = {
        generate_enum_is_method = false,
      },
      cargo = {
        allFeatures = true,
        buildScripts = {
          enable = true,
        },
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
          "-A",
          "clippy::missing-const-for-fn",
          -- "-W",
          -- "clippy::restriction",
        },
        -- extraArgs = { "--no-deps" },
      },
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      inlayHints = {
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true,
        },
        expressionAdjustmentHints = {
          enable = true,
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
