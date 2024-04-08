-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:

-- Customize Mason plugins
local astrocore = require "astrocore"

-- lsps_to_install (((

local lsps_to_install = {
  "clangd",
  "lua_ls",
  -- "denols",
  -- "lemminx", -- XML Language Server written in 'java' (can be installed without dependency troubles)
  -- "ltex",  -- can be installed without dependency troubles
  -- "marksman", -- can be installed without dependency troubles
  -- "marksman", -- written in F#  -- can be installed without any dependency troubles
  -- "prosemd_lsp", -- can be installed without dependency troubles
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
  -- "editorconfig-checker",
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

-- golang-based tools (((

if vim.fn.executable "go" == 1 then
  -- astrocore.list_insert_unique(linters_formatters_to_install, "misspell")
  -- astrocore.list_insert_unique(lsps_to_install, "sqls")
  astrocore.list_insert_unique(lsps_to_install, { "bufls" })
  astrocore.list_insert_unique(linters_formatters_to_install, { "buf", "checkmake", "protolint" })
end

-- )))

-- npm-based tools (((

if vim.fn.executable "npm" == 1 then
  astrocore.list_insert_unique(lsps_to_install, { "jsonls", "spectral", "vimls", "yamlls" })
  astrocore.list_insert_unique(
    linters_formatters_to_install,
    { "alex", "commitlint", "cspell", "fixjson", "jsonlint", "markdownlint", "remark-cli", "textlint", "write-good" }
  )
  -- astrocore.list_insert_unique(lsps_to_install, {"cssls"})
  -- astrocore.list_insert_unique(lsps_to_install, {"html"})
  -- astrocore.list_insert_unique(lsps_to_install, {"intelephense"})
  -- astrocore.list_insert_unique(lsps_to_install, {"tsserver"})

  -- npm + docker tools (((
  if vim.fn.executable "docker" == 1 then
    astrocore.list_insert_unique(lsps_to_install, { "dockerls", "docker_compose_language_service" })
  end
  -- )))

  if vim.fn.executable "perl" == 1 then astrocore.list_insert_unique(lsps_to_install, { "perlnavigator" }) end
end

-- )))

-- python-based tools (((

if vim.fn.executable "python3" == 1 then
  -- if vim.fn.executable "npm" == 1 then
  --   astrocore.list_insert_unique(lsps_to_install, "pyright")
  -- end

  if vim.fn.executable "pip3" == 1 or vim.fn.executable "conda" == 1 or vim.fn.executable "mamba" == 1 then
    astrocore.list_insert_unique(daps_to_install, { "debugpy" })
    -- astrocore.list_insert_unique(lsps_to_install, { "pyre" })
    astrocore.list_insert_unique(lsps_to_install, { "pylsp" })
    astrocore.list_insert_unique(linters_formatters_to_install, {
      "autoflake",
      "clang_format",
      "codespell",
      "cpplint",
      "flake8",
      "gitlint",
      "mdformat",
      "proselint",
      "pydocstyle",
      "pylama",
      "reorder_python_imports",
      "semgrep",
      "usort",
      "vint",
      "vulture",
      "yamlfix",
      "yamllint",
      -- "mypy",
      -- "pylint",
      -- "pyproject_flake8",
    })

    --- python + rust/cargo tools (((

    if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" == 1 then
      astrocore.list_insert_unique(linters_formatters_to_install, { "ruff", "shellharden" })
      --   astrocore.list_insert_unique(lsps_to_install, "pylyzer")
    end

    -- )))

    -- python + cmake tools (((

    if vim.fn.executable "cmake" == 1 then
      astrocore.list_insert_unique(linters_formatters_to_install, { "cmake_format", "cmakelint", "gersemi" })
    end

    -- )))
    -- if vim.fn.executable "gfortran" == 1 then astrocore.list_insert_unique(lsps_to_install, "fortls") end
    -- astrocore.list_insert_unique(lsps_to_install, "sourcery")
  end
end

-- )))

-- luarocks-based tools (((

if vim.fn.executable "luarocks" == 1 then
  astrocore.list_insert_unique(linters_formatters_to_install, { "luacheck" })
end

-- )))

-- bash-based tools (((
if vim.fn.executable "bash" == 1 or vim.fn.executable "sh" == 1 then
  astrocore.list_insert_unique(lsps_to_install, { "bashls" })
  astrocore.list_insert_unique(linters_formatters_to_install, { "shellcheck", "shfmt" })
  astrocore.list_insert_unique(daps_to_install, { "bash" })

  -- bash + python tools (((

  if vim.fn.executable "python3" == 1 and vim.fn.executable "pip3" == 1 then
    astrocore.list_insert_unique(linters_formatters_to_install, { "beautysh" })
  end

  -- )))
end
-- )))

-- rust-based tools (((

if vim.fn.has "macunix" and vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  astrocore.list_insert_unique(lsps_to_install, { "asm_lsp", "neocmake", "nil_ls", "taplo" })
else
  astrocore.list_insert_unique(lsps_to_install, { "cmake" })
end

-- )))

-- if vim.fn.executable "dotnet" == 1 then astrocore.list_insert_unique(lsps_to_install, { "omnisharp" }) end
-- if vim.fn.executable "r" then astrocore.list_insert_unique(lsps_to_install, { "r_language_server" }) end

-- )))

---@diagnostic disable-next-line: undefined-doc-name
---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = lsps_to_install
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = linters_formatters_to_install
      opts.automatic_installation = false
      opts.automatic_setup = false
      opts.handlers = {
        function() end, -- disables automatic setup of all null-ls sources
        -- taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = daps_to_install
    end,
  },
}
