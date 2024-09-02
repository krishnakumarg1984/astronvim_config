-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins (((
local astrocore = require "astrocore"

-- lsps_to_install initial table created here (((

-- lsp servers for general-purpose editing that are easily binary installable via mason without dependencies and not available in nixpkgs or brew
-- There are so many interesting LSPs. Check out:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service
-- https://mason-registry.dev/registry/list?search=category%3Alsp
-- https://microsoft.github.io/language-server-protocol/implementors/servers/
local lsps_to_install = {
  -- "denols", -- not available in either brew or nixpkgs (as of Aug 2024). So install with mason
}

-- lsp servers for general purpose editing and for languages. All these lsps are easy binary-available and should be installed with mason only if not externally installed already & available in PATH (((
for server, cmd in pairs {
  -- ast_grep = "ast-grep", -- to study and look at this tool further
  -- sonarlint_ls = "sonarlint-ls", -- nvim_lsp server config not available Sep 2024 (check whether easily binary-installable)
  harper_ls = "harper-ls", -- The Grammar Checker for Developers. Written in Rust
  markdown_oxide = "markdown-oxide", -- Robust, Minimalist, Unbundled PKM for your favorite text-editor through the LSP, written in Rust
  marksman = "marksman", -- Write Markdown with code assist and intelligence in the comfort of your favourite editor. Written in F#
  taplo = "taplo", -- TOML toolkit written in Rust
  typos_lsp = "typos-lsp", -- Source code spell checker. Written in Rust
  vale_ls = "vale-ls", -- LSP implementation for the Vale command-line tool. Written in Rust
} do
  if vim.fn.executable(cmd) == 0 then
    -- vim.print(cmd .. " not available in PATH")
    table.insert(lsps_to_install, server)
  end
end
-- )))
-- )))

-- linters_formatters_to_install (((

local linters_formatters_to_install = {}

for linter_formatter, linters_formatter_cmd in pairs {
  actionlint = "actionlint", -- golang-based, but installs as binary executable without any dependencies
  -- astgrep = "ast-grep", -- have to learn how to use this
  -- astyle = "astyle",
  -- cbfmt = "cbfmt",
  -- editorconfig_checker = "editorconfig-checker",
  -- hadolint = "hadolint", -- written in haskell
  -- markuplint = "markuplint", -- html linter. not in brew or nixpkgs as of Sep 2024. Install with mason
  -- mdslw = "mdslw", -- markdown formatter. not in brew or nixpkgs as of Sep 2024. Install with mason
  -- selene = "selene",
  stylua = "stylua",
  -- vacuum = "vacuum",
  -- vale = "vale",
  -- yamlfmt = "yamlfmt",
} do
  if vim.fn.executable(linters_formatter_cmd) == 0 then
    table.insert(linters_formatters_to_install, linter_formatter)
  end
end

-- )))

-- daps_to_install (((

local daps_to_install = {
  -- "bashdb"
  -- "codelldb",
  -- "python",
  -- "delve",
  -- "js",
  -- "php",
}

-- )))

-- various conditional tool installations (((

-- tools written in bash (((
if vim.fn.executable "bash" == 1 or vim.fn.executable "sh" == 1 then
  -- astrocore.list_insert_unique(linters_formatters_to_install, { "shellcheck", "shfmt" })
  -- astrocore.list_insert_unique(daps_to_install, { "bash" })

  -- tools written in bash meant to help edit python source code  (((

  -- if vim.fn.executable "python3" == 1 and vim.fn.executable "pip3" == 1 then
  --   -- astrocore.list_insert_unique(linters_formatters_to_install, { "beautysh" })
  -- end

  -- )))
end
-- )))

-- tools written in c/c++ (((
if vim.fn.executable "clang" or vim.fn.executable "g++" == 1 then
  for server, cmd in pairs {
    clangd = "clangd", -- not available via brew or nix (as of Sep 2024). So install with mason
  } do
    if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
  end
end
-- )))

-- tools written in go-language (((

-- if vim.fn.executable "go" == 1 then
--   -- astrocore.list_insert_unique(linters_formatters_to_install, "misspell")
--   -- astrocore.list_insert_unique(lsps_to_install, "sqls")
--   -- astrocore.list_insert_unique(lsps_to_install, { "bufls" })
--   -- astrocore.list_insert_unique(linters_formatters_to_install, { "buf", "checkmake", "protolint" })
-- end

-- )))

-- tools written in javascript & requires npm (((

if vim.fn.executable "npm" == 1 then
  -- install general npm-written LSPs not available in PATH via mason (((
  astrocore.list_insert_unique(lsps_to_install, {
    -- "html"
    -- "intelephense"
    -- "tsserver"
    -- "vimls",
    -- "yamlls"
  })
  -- )))

  -- install general npm-written linters and formatters not available in PATH via mason (((
  astrocore.list_insert_unique(linters_formatters_to_install, {
    "alex", -- not installable via nixpkgs as of Sep 2024. Hence install via mason
    -- "commitlint",
    -- "cspell",
    -- "fixjson",
    -- "jsonlint",
    -- "markdownlint_cli2",
    -- "textlint",
    -- "write-good"
  })
  -- )))

  -- install npm-written LSPs not available in PATH via mason
  for server, cmd in pairs {
    biome = "biome", -- A toolchain for web projects, aimed to provide functionalities to maintain them. Biome offers formatter and linter, usable via CLI and LSP. Requires npm to install even if written in Rust
    jsonls = "vscode-json-languageserver", -- JSON language service extracted from VSCode to be reused, e.g in the Monaco editor. Not available yet in nixpkgs as of Sep 2024. Hence install via mason
    yamlls = "yaml-language-server", -- Language Server for YAML Files
    -- zk = "zk" -- A plain text note-taking assistant.
  } do
    if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
  end

  if vim.fn.executable "awk" == 1 then
    astrocore.list_insert_unique(lsps_to_install, { "awk_ls" }) -- not available in nixpkgs as of Sep 2024, so install with mason
  end

  if vim.fn.executable "bash" == 1 then
    --  astrocore.list_insert_unique(lsps_to_install, { "bashls" }) end
    --  astrocore.list_insert_unique(lsps_to_install, { "perlnavigator" }) end
    for server, cmd in pairs {
      bashls = "bash-language-server", -- requires npm for installing via mason
    } do
      if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
    end
  end

  if vim.fn.executable "vim" == 1 or vim.fn.executable "nvim" == 1 then
    for server, cmd in pairs {
      vimls = "vim-language-server", -- VImScript language server, LSP for vim script
    } do
      if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
    end
  end

  -- tools written in npm for assisting with docker (((
  if vim.fn.executable "docker" == 1 then
    for server, cmd in pairs {
      dockerls = "docker-langserver", -- A language server for Dockerfiles powered by Node.js, TypeScript, and VSCode technologies.
    } do
      if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
    end
    if vim.fn.executable "docker-compose" == 1 then
      for server, cmd in pairs {
        docker_compose_language_service = "docker-compose-language-server", -- Language service for Docker Compose documents
      } do
        if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
      end
    end
  end
  -- )))
end

-- )))

-- tools written in julia (((

if vim.fn.executable "julia" == 1 then
  -- install julia-written LSPs using mason only if not externally installed already and available in PATH
  for server, cmd in pairs {
    julials = "julia-lsp", -- julia-lsp is an easy-install binary through mason. But anyway is pointless without julia language executable in PATH
  } do
    if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
  end
end

-- )))

-- tools written in lua (((

if vim.fn.executable "lua" == 1 then
  for server, cmd in pairs {
    lua_ls = "lua-language-server", -- Language server that offers lua support.
  } do
    if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
  end
end

-- )))

-- tools that require luarocks (((

-- if vim.fn.executable "luarocks" == 1 then
--   -- astrocore.list_insert_unique(linters_formatters_to_install, { "luacheck" })
-- end

-- )))

-- tools that need python3 (((

if vim.fn.executable "python3" == 1 then
  -- install python-written LSPs using mason
  astrocore.list_insert_unique(lsps_to_install, { "textlsp" }) -- Language server for text spell and grammar check with various tools. Not available in nixpkgs or elsewhere as of Sep 2024

  -- install python-written LSPs using mason only if not externally installed already and available in PATH
  for server, cmd in pairs {
    basedpyright = "basedpyright", -- pyright fork with various type checking improvements, improved vscode support and pylance features built into the language server. requires python3 in PATH
    ruff = "ruff", -- An extremely fast Python linter and code formatter, written in Rust.
  } do
    if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
  end

  if vim.fn.executable "pip3" == 1 or vim.fn.executable "conda" == 1 or vim.fn.executable "mamba" == 1 then
    -- astrocore.list_insert_unique(daps_to_install, { "debugpy" })
    -- astrocore.list_insert_unique(lsps_to_install, { "pyre" })
    -- astrocore.list_insert_unique(lsps_to_install, { "pylsp" })
    -- astrocore.list_insert_unique(linters_formatters_to_install, {
    --   "autoflake",
    --   "clang_format",
    --   "codespell",
    --   "cpplint",
    --   "flake8",
    --   "gitlint",
    --   "mdformat",
    --   "proselint",
    --   "pydocstyle",
    --   "pylama",
    --   "reorder_python_imports",
    --   "usort",
    --   "vint",
    --   "vulture",
    --   "yamlfix",
    --   "yamllint",
    --   -- "mypy",
    --   -- "pylint",
    --   -- "pyproject_flake8",
    -- })

    --- python + rust/cargo tools (((

    -- if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" == 1 then
    --   -- astrocore.list_insert_unique(linters_formatters_to_install, { "shellharden" })
    --   --   astrocore.list_insert_unique(lsps_to_install, "pylyzer")
    -- end

    -- )))

    -- python + cmake tools (((

    -- if vim.fn.executable "cmake" == 1 then
    --   -- astrocore.list_insert_unique(linters_formatters_to_install, { "cmake_format", "cmakelint", "gersemi" })
    -- end

    -- )))

    if vim.fn.executable "gfortran" == 1 or vim.fn.executable "lfortran" == 1 then
      for server, cmd in pairs {
        fortls = "fortls", -- Fortran Language Server
      } do
        if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
      end
    end
    -- astrocore.list_insert_unique(lsps_to_install, "sourcery")
  end
end

-- )))

-- tools written in rust and that requires ructc and cargo (((
-- astrocore.list_insert_unique(lsps_to_install, { "asm_lsp", "nil_ls", "taplo" })

if vim.fn.has "macunix" and vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  for server, cmd in pairs {
    rust_analyzer = "rust-analyzer", -- Modular compiler frontend for the Rust language. Written in Rust. But actually has no dependency on rust being available in PATH. It is an easy binary install via mason. Just doing conditional installation because there is no use for rust-analyzer without rustc available in PATH
  } do
    if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
  end
  -- tools written in rust that requires rustc and for editing cmake source code  (((
  if vim.fn.executable "cmake" == 1 then
    for server, cmd in pairs {
      neocmake = "neocmakelsp", -- have to use the name in https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#neocmake. CMake LSP implementation based on Tower and Tree-sitter. Written in Rust
    } do
      if vim.fn.executable(cmd) == 0 then table.insert(lsps_to_install, server) end
    end
  end

  -- )))
end

-- )))

-- )))
-- if vim.fn.executable "dotnet" == 1 then astrocore.list_insert_unique(lsps_to_install, { "omnisharp" }) end
-- if vim.fn.executable "r" then astrocore.list_insert_unique(lsps_to_install, { "r_language_server" }) end

-- )))
-- )))

---@diagnostic disable-next-line: undefined-doc-name
---@type LazySpec
return {
  {
    "williamboman/mason.nvim", -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
    opts = { PATH = "skip" },
  },
  -- use mason-lspconfig to configure LSP installations(((
  {
    "williamboman/mason-lspconfig.nvim", -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- add more arguments for adding more language servers
      ensure_installed = lsps_to_install,
    },
  },
  -- )))
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources(((
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = linters_formatters_to_install,
      automatic_installation = false,
      automatic_setup = false,
    },
  },
  -- )))
  -- use mason-nvim-dap to configure debuggers (((
  {
    "jay-babu/mason-nvim-dap.nvim", -- mason-nvim-dap bridges mason.nvim with the nvim-dap plugin - making it easier to use both plugins together.
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = daps_to_install
    end,
  },
  -- )))
}
