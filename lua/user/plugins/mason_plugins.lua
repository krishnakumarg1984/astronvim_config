local lsps_to_install = {
  "clangd",
  "jsonls",
  "lua_ls",
  "marksman",
  -- "lemminx", -- XML Language Server written in 'java'
  -- "ltex",
  -- "prosemd_lsp",
  -- "zk",
}

if vim.fn.executable "cmake" == 1 then
  if vim.fn.has "macunix" and vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
    table.insert(lsps_to_install, "neocmake")
  else
    table.insert(lsps_to_install, "cmake")
  end
end

-- if vim.fn.executable "go" == 1 then
--   -- table.insert(my_ensure_installed, "gopls")
--   -- table.insert(my_ensure_installed, "arduino_language_server")
-- end

if vim.fn.executable "node" == 1 then
  table.insert(lsps_to_install, "denols")
  table.insert(lsps_to_install, "vimls")
  table.insert(lsps_to_install, "yamlls")
  table.insert(lsps_to_install, "spectral")
  if vim.fn.executable "bash" == 1 then table.insert(lsps_to_install, "bashls") end
  if vim.fn.executable "docker" == 1 then table.insert(lsps_to_install, "dockerls") end
  if vim.fn.executable "perl" == 1 then table.insert(lsps_to_install, "perlnavigator") end
end

if vim.fn.executable "python3" == 1 then
  table.insert(lsps_to_install, "pylsp")
  table.insert(lsps_to_install, "pyre")
  -- table.insert(my_ensure_installed, "pyright")
  -- table.insert(my_ensure_installed, "sourcery")
  -- if vim.fn.executable "gfortran" == 1 then table.insert(my_ensure_installed, "fortlsp") end
  -- if vim.fn.executable "ruff" == 1 then
  -- table.insert(my_ensure_installed, "ruff_lsp")
  -- end
end

if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  table.insert(lsps_to_install, "rust_analyzer")
  table.insert(lsps_to_install, "taplo")
  table.insert(lsps_to_install, "texlab")
  -- table.insert(my_ensure_installed, "asm_lsp")
end

-- if vim.fn.executable "dotnet" == 1 then table.insert(my_ensure_installed, "omnisharp") end
-- if vim.fn.executable "julia" then table.insert(my_ensure_installed, "julials") end
-- if vim.fn.executable "protoc" == 1 and vim.fn.executable "go" == 1 then table.insert(my_ensure_installed, "bufls") end
-- if vim.fn.executable "r" then table.insert(my_ensure_installed, "r_language_server") end

local mason_tools_to_install = {
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
  "selene",
  "semgrep",
  "shellcheck",
  "shfmt",
  "stylua",
  "textlint",
  "usort",
  "vale",
  "vint",
  "vulture",
  "write-good",
  "yamlfmt",
  "yamllint",
  -- "cbfmt",
  -- "cppcheck",
  -- "editorconfig-checker",
  -- "pylama",
  -- "pyproject_flake8",
  -- "rome",
  -- "vacuum",
}

if vim.fn.executable "luarocks" == 1 then table.insert(mason_tools_to_install, "luacheck") end

return {
  -- { "williamboman/mason.nvim", opts = { PATH = "append" } },
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = lsps_to_install },
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
      ensure_installed = mason_tools_to_install,
      automatic_installation = false,
      automatic_setup = false,
      handlers = {
        function() end, -- disables automatic setup of all null-ls sources
        -- taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
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
