-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:

local utils = require "astronvim.utils"

-- lsps_to_install (((

local lsps_to_install = {
  "clangd",
  "lua_ls",
  "marksman", -- written in F#
  -- "cssls",
  -- "html",
  -- "intelephense",
  -- "lemminx", -- XML Language Server written in 'java'
  -- "ltex",
  -- "marksman",
  -- "prosemd_lsp",
  -- "sqls",
  -- "texlab",
  -- "tsserver",
  -- "yamlls",
  -- "zk",
}

-- )))

-- linters_formatters_to_install (((

local linters_formatters_to_install = {
  "actionlint",
  -- "astyle",
  "autoflake",
  "black",
  "clang_format",
  "codespell", -- useful for many languages
  "commitlint",
  "cpplint",
  "cspell",
  "fixjson",
  "flake8",
  "gitlint", -- useful across languages
  "hadolint", -- written in haskell
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

-- )))

-- daps_to_install (((

local daps_to_install = {
  "codelldb",
  "python",
  -- "delve",
  -- "js",
  -- "php",
}

-- )))

if vim.fn.executable "cmake" == 1 then
  if vim.fn.has "macunix" and vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
    utils.list_insert_unique(lsps_to_install, "neocmake")
  else
    utils.list_insert_unique(lsps_to_install, "cmake")
  end
  utils.list_insert_unique(linters_formatters_to_install, { "cmake_format", "cmakelint", "gersemi" })
end

if vim.fn.executable "node" == 1 then
  -- utils.list_insert_unique(lsps_to_install, "denols")
  utils.list_insert_unique(lsps_to_install, "jsonls") -- written in typescript
  utils.list_insert_unique(lsps_to_install, "spectral")
  utils.list_insert_unique(lsps_to_install, "vimls")
  utils.list_insert_unique(lsps_to_install, "yamlls")
  if vim.fn.executable "bash" == 1 or vim.fn.executable "sh" == 1 then
    utils.list_insert_unique(lsps_to_install, "bashls")
  end
  if vim.fn.executable "docker" == 1 then
    utils.list_insert_unique(lsps_to_install, { "dockerls", "docker_compose_language_service" })
  end -- written in typescript
  if vim.fn.executable "perl" == 1 then utils.list_insert_unique(lsps_to_install, "perlnavigator") end

  utils.list_insert_unique(linters_formatters_to_install, "jsonlint")
end

if vim.fn.executable "python3" == 1 then
  -- utils.list_insert_unique(lsps_to_install, "pylsp")
  utils.list_insert_unique(lsps_to_install, "pyre")
  utils.list_insert_unique(lsps_to_install, "pyright")
  -- utils.list_insert_unique(my_ensure_installed, "sourcery")
  -- if vim.fn.executable "gfortran" == 1 then utils.list_insert_unique(my_ensure_installed, "fortlsp") end
  utils.list_insert_unique(lsps_to_install, "ruff_lsp")
end

if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  utils.list_insert_unique(lsps_to_install, "taplo")
  utils.list_insert_unique(lsps_to_install, "texlab")
  utils.list_insert_unique(linters_formatters_to_install, { "selene", "stylua" })
  -- utils.list_insert_unique(my_ensure_installed, "asm_lsp")
  utils.list_insert_unique(lsps_to_install, "rust_analyzer") -- installed by community 'rust' pack
end

-- if vim.fn.executable "dotnet" == 1 then utils.list_insert_unique(my_ensure_installed, "omnisharp") end
-- if vim.fn.executable "r" then utils.list_insert_unique(my_ensure_installed, "r_language_server") end
if vim.fn.executable "luarocks" == 1 then utils.list_insert_unique(linters_formatters_to_install, "luacheck") end
if vim.fn.executable "bash" == 1 or vim.fn.executable "sh" == 1 then
  utils.list_insert_unique(linters_formatters_to_install, { "shellcheck", "shfmt" })
  utils.list_insert_unique(daps_to_install, { "bash" })
end

return {
  -- { "williamboman/mason.nvim", opts = { PATH = "append" } },
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = lsps_to_install },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = linters_formatters_to_install,
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
    opts = { ensure_installed = daps_to_install },
  },
}
