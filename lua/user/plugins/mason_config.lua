local my_ensure_installed = {
  "clangd",
  "sumneko_lua",
  -- "lemminx", -- XML Language Server written in 'java'
  -- "ltex",
  -- "marksman",
  -- "prosemd_lsp",
  -- "zk",
}
if vim.fn.executable "cmake" == 1 then
  if vim.fn.has "macunix" and vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
    table.insert(my_ensure_installed, "neocmake")
  else
    table.insert(my_ensure_installed, "cmake")
  end
end

-- if vim.fn.executable "go" == 1 then
--   -- table.insert(my_ensure_installed, "gopls")
--   -- table.insert(my_ensure_installed, "arduino_language_server")
-- end

if vim.fn.executable "node" == 1 then
  table.insert(my_ensure_installed, "vimls")
  table.insert(my_ensure_installed, "yamlls")
  if vim.fn.executable "bash" == 1 then table.insert(my_ensure_installed, "bashls") end
  if vim.fn.executable "docker" == 1 then table.insert(my_ensure_installed, "dockerls") end
  if vim.fn.executable "perl" == 1 then table.insert(my_ensure_installed, "perlnavigator") end
end

if vim.fn.executable "python3" == 1 then
  table.insert(my_ensure_installed, "pylsp")
  -- if vim.fn.executable "gfortran" == 1 then table.insert(my_ensure_installed, "fortlsp") end
end

if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  table.insert(my_ensure_installed, "rust_analyzer")
  table.insert(my_ensure_installed, "taplo")
  table.insert(my_ensure_installed, "texlab")
  -- table.insert(my_ensure_installed, "asm_lsp")
end

-- if vim.fn.executable "dotnet" == 1 then table.insert(my_ensure_installed, "omnisharp") end
-- if vim.fn.executable "julia" then table.insert(my_ensure_installed, "julials") end
-- if vim.fn.executable "protoc" == 1 and vim.fn.executable "go" == 1 then table.insert(my_ensure_installed, "bufls") end
-- if vim.fn.executable "r" then table.insert(my_ensure_installed, "r_language_server") end

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = my_ensure_installed,
    },
    -- opts = {
    --   ensure_installed = {
    --     "cssls",
    --     "gopls",
    --     "html",
    --     "intelephense",
    --     "marksman",
    --     "neocmake",
    --     "jsonls",
    --     "pyright",
    --     "sqls",
    --     "sumneko_lua",
    --     "taplo",
    --     "texlab",
    --     "tsserver",
    --     "yamlls",
    --   },
    -- },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "actionlint",
        "black",
        "clang_format",
        "cmake_format",
        "codespell",
        "commitlint",
        "cppcheck",
        "cpplint",
        "cspell",
        "editorconfig-checker",
        "fixjson",
        "flake8",
        "gitlint",
        "hadolint",
        "jsonlint",
        "markdownlint",
        "misspell",
        "mypy",
        "proselint",
        "pylint",
        "shellcheck",
        "shfmt",
        "stylua",
        "vale",
        "vint",
        "write-good",
        "yamllint",
        -- "cbfmt",
        -- "luacheck",
      },
      automatic_setup = false,
    },
  },
}
