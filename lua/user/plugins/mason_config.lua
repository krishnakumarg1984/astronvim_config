local my_ensure_installed = {
  "clangd",
  "lua_ls",
  "marksman",
  -- "lemminx", -- XML Language Server written in 'java'
  -- "ltex",
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
  table.insert(my_ensure_installed, "denols")
  table.insert(my_ensure_installed, "vimls")
  table.insert(my_ensure_installed, "yamlls")
  if vim.fn.executable "bash" == 1 then table.insert(my_ensure_installed, "bashls") end
  if vim.fn.executable "docker" == 1 then table.insert(my_ensure_installed, "dockerls") end
  if vim.fn.executable "perl" == 1 then table.insert(my_ensure_installed, "perlnavigator") end
end

if vim.fn.executable "python3" == 1 then
  table.insert(my_ensure_installed, "pylsp")
  table.insert(my_ensure_installed, "pyre")
  -- table.insert(my_ensure_installed, "pyright")
  -- table.insert(my_ensure_installed, "sourcery")
  -- if vim.fn.executable "gfortran" == 1 then table.insert(my_ensure_installed, "fortlsp") end
  -- if vim.fn.executable "ruff" == 1 then
  -- table.insert(my_ensure_installed, "ruff_lsp")
  -- end
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
  -- { "williamboman/mason.nvim", opts = { PATH = "append" } },
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = my_ensure_installed },
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
        "autoflake",
        "black",
        "clang_format",
        "cmake_format",
        "cmakelint",
        "codespell", -- useful for many languages
        "commitlint",
        "cpplint",
        "cspell",
        "editorconfig-checker",
        "fixjson",
        "flake8",
        "gersemi",
        "gitlint", -- useful across languages
        "hadolint",
        "jsonlint",
        "markdownlint",
        "misspell",
        "mypy",
        "proselint",
        "pydocstyle", -- pylama covers this
        "pylama",
        "pylint", -- pylama covers this
        "pyre",
        "reorder_python_imports",
        "ruff", -- covers a superset of pylama
        "semgrep",
        "shellcheck",
        "shfmt",
        "stylua",
        "usort",
        "vale",
        "vint",
        "vulture",
        "write-good",
        "yamllint",
        "yamlfmt",
        -- "cbfmt",
        -- "cppcheck",
        -- "pylama",
        -- "pyproject_flake8",
      },
      automatic_setup = false,
      handlers = {
        taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "bash",
        "codelldb",
        "python",
        -- "delve",
        -- "js",
        -- "php",
      },
    },
  },
}
