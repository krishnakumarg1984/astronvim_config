-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:

local utils = require "astronvim.utils"

-- lsps_to_install (((

local lsps_to_install = {
  "clangd",
  "lua_ls",
  "taplo",
  -- "denols",
  -- "lemminx", -- XML Language Server written in 'java' (can be installed without dependency troubles)
  -- "ltex",  -- can be installed without dependency troubles
  -- "marksman", -- can be installed without dependency troubles
  -- "marksman", -- written in F#  -- can be installed without any dependency troubles
  -- "prosemd_lsp", -- can be installed without dependency troubles
  -- "rust_analyzer",
  -- "texlab", -- can be installed without dependency troubles
  -- "zk", -- can be installed without any dependency troubles
}

-- )))

-- linters_formatters_to_install (((

local linters_formatters_to_install = {
  "actionlint",
  "hadolint", -- written in haskell
  "selene",
  "stylua",
  "vale",
  "yamlfmt",
  -- "astyle",
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
  -- "python",
  -- "delve",
  -- "js",
  -- "php",
}

-- )))

if vim.fn.executable "go" == 1 then
  -- utils.list_insert_unique(linters_formatters_to_install, "misspell")
  -- utils.list_insert_unique(lsps_to_install, "sqls")
  utils.list_insert_unique(lsps_to_install, { "bufls" })
  utils.list_insert_unique(linters_formatters_to_install, { "buf", "protolint" })
end

if vim.fn.executable "npm" == 1 then
  -- utils.list_insert_unique(lsps_to_install, "cssls")
  -- utils.list_insert_unique(lsps_to_install, "html")
  -- utils.list_insert_unique(lsps_to_install, "intelephense")
  -- utils.list_insert_unique(lsps_to_install, "tsserver")
  utils.list_insert_unique(lsps_to_install, { "jsonls", "spectral", "vimls", "yamlls" })
  if vim.fn.executable "bash" == 1 or vim.fn.executable "sh" == 1 then
    utils.list_insert_unique(lsps_to_install, "bashls")
  end
  if vim.fn.executable "docker" == 1 then
    utils.list_insert_unique(lsps_to_install, { "dockerls", "docker_compose_language_service" })
  end
  if vim.fn.executable "perl" == 1 then
    utils.list_insert_unique(lsps_to_install, "perlnavigator")
  end

  utils.list_insert_unique(linters_formatters_to_install, "jsonlint")
  utils.list_insert_unique(
    linters_formatters_to_install,
    { "commitlint", "cspell", "fixjson", "markdownlint", "textlint", "write-good" }
  )
end

if vim.fn.executable "python3" == 1 then
  -- utils.list_insert_unique(lsps_to_install, "pylsp")
  if vim.fn.executable "npm" == 1 then
    utils.list_insert_unique(lsps_to_install, "pyright")
  end

  if vim.fn.executable "pip3" == 1 or vim.fn.executable "conda" == 1 or vim.fn.executable "mamba" == 1 then
    utils.list_insert_unique(daps_to_install, "debugpy")
    utils.list_insert_unique(lsps_to_install, { "pyre", "ruff_lsp" })
    utils.list_insert_unique(linters_formatters_to_install, {
      "autoflake",
      "black",
      "clang_format",
      "codespell",
      "cpplint",
      "flake8",
      "gitlint",
      "mypy",
      "proselint",
      "pydocstyle",
      "pylama",
      "pylint",
      "reorder_python_imports",
      "ruff",
      "semgrep",
      "usort",
      "vint",
      "vulture",
      "yamllint",
    })
    if vim.fn.executable "cmake" == 1 then
      utils.list_insert_unique(linters_formatters_to_install, { "cmake_format", "cmakelint", "gersemi" })
      if vim.fn.has "macunix" and vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
        utils.list_insert_unique(lsps_to_install, "neocmake")
      else
        utils.list_insert_unique(lsps_to_install, "cmake")
      end
    end
    -- if vim.fn.executable "gfortran" == 1 then utils.list_insert_unique(lsps_to_install, "fortls") end
    -- utils.list_insert_unique(lsps_to_install, "sourcery")
  end
end

if vim.fn.executable "luarocks" == 1 then
  utils.list_insert_unique(linters_formatters_to_install, "luacheck")
end
if vim.fn.executable "bash" == 1 or vim.fn.executable "sh" == 1 then
  utils.list_insert_unique(linters_formatters_to_install, { "shellcheck", "shfmt" })
  utils.list_insert_unique(daps_to_install, { "bash" })
end

-- if vim.fn.executable "dotnet" == 1 then utils.list_insert_unique(my_ensure_installed, "omnisharp") end
-- if vim.fn.executable "r" then utils.list_insert_unique(my_ensure_installed, "r_language_server") end
-- if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
--   utils.list_insert_unique(lsps_to_install, "asm_lsp")
-- end

-- (((
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
-- )))
