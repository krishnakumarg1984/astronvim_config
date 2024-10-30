-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:

local mason_tools_to_install = {}

-- lsp servers for general purpose editing. All these lsps are easy binary-available, but should be installed with mason only if they have not already been installed externally & made available in PATH
for _, server_cmd in ipairs {
  "taplo", -- TOML toolkit written in Rust
  -- "ast-grep", -- to study and look at this tool further
  -- "harper-ls", -- The Grammar Checker for Developers. Written in Rust. Requires a modern GLIBC
  -- "markdown-oxide", -- Robust, Minimalist, Unbundled PKM for text-editor through the LSP, written in Rust, Requires a new-ish glibc
  -- "marksman", -- Write Markdown with code assist and intelligence in the comfort of your favourite editor. Written in F#. Too difficult on hpcs
  -- "sonarlint-ls", -- nvim_lsp server config not available Sep 2024 (check whether easily binary-installable)
  -- "typos-lsp", -- Source code spell checker. Written in Rust. Requires a modern GLIBC
  -- "vale-ls", -- LSP implementation for the Vale command-line tool. Written in Rust. Requires a modern GLIBC
} do
  if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
end

-- install easily binary-installable linters & formatters that are not already in PATH (((
for _, linter_formatter_cmd in ipairs {
  "actionlint", -- Static checker for GitHub Actions workflow files
  "checkmake", -- experimental linter/analyzer for Makefiles
  "shfmt", -- A shell parser, formatter, and interpreter with bash support; includes shfmt
  "stylua",
  -- "ast-grep", -- have to learn how to use this
  -- "shellcheck", -- ShellCheck, a static analysis tool for shell scripts. Deprecated in none-ls
  -- "astyle",
  -- "cbfmt",
  -- "editorconfig-checker",
  -- "hadolint", -- written in haskell
  -- "markuplint", -- html linter. not in brew or nixpkgs as of Sep 2024. Install with mason
  -- "mdslw", -- markdown formatter. not in brew or nixpkgs as of Sep 2024. Install with mason
  -- "selene",
  -- "vacuum",
  -- "vale",
  -- "yamlfmt",
} do
  if vim.fn.executable(linter_formatter_cmd) == 0 then table.insert(mason_tools_to_install, linter_formatter_cmd) end
end
-- )))

-- install easily binary-installable daps that are not already in PATH (((
for dap_cmd in ipairs {
  -- "bashdb",
  -- "codelldb",
  -- "python",
  -- "delve",
  -- "js",
  -- "php",
} do
  if vim.fn.executable(dap_cmd) == 0 then table.insert(mason_tools_to_install, dap_cmd) end
end

-- various conditional tool installations (((
local astrocore = require "astrocore"

-- if vim.fn.executable "bash" == 1 or vim.fn.executable "sh" == 1 then
--   astrocore.list_insert_unique(mason_tools_to_install, { "bash" })
-- end

-- tools written in c/c++ (((
if vim.fn.executable "clang++" == 1 or vim.fn.executable "g++" == 1 then
  for _, server_cmd in ipairs {
    "clangd", -- not available via nix or brew (as of Sep 2024).
  } do
    if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
  end
end
-- )))

-- tools written in go-language (((
-- if vim.fn.executable "go" == 1 then
--   astrocore.list_insert_unique(mason_tools_to_install, { "buf", "bufls", "checkmake", "misspell", "protolint", "sqls" })
-- end
-- )))

-- tools written in javascript & requires npm (((
if vim.fn.executable "npm" == 1 then
  -- install general npm-written LSPs not available in PATH via mason (((
  astrocore.list_insert_unique(mason_tools_to_install, {
    -- "html"
    -- "intelephense"
    -- "tsserver"
    -- "vimls",
    -- "yamlls"
  })
  -- )))

  -- install general npm-written linters and formatters not available in PATH via mason (((
  astrocore.list_insert_unique(mason_tools_to_install, {
    "alex", -- Catch insensitive, inconsiderate writing.
    -- "cpplint", -- Cpplint is a command-line tool to check C/C++ files for style issues following Google's C++ style guide. Problematic nixpkgs build as of Sep 2024. cpplint has been deprecated in none-ls.
    -- "cspell", -- A Spell Checker for Code! Deprecated in none-ls
    -- "fixjson",
    -- "jsonlint",
    -- "markdownlint_cli2",
    -- "textlint",
    -- "write-good"
  })
  -- )))

  -- install npm-written LSPs not available in PATH via mason (((
  for _, server_cmd in ipairs {
    "biome", -- A toolchain for web projects, aimed to provide functionalities to maintain them. Biome offers formatter and linter, usable via CLI and LSP. Requires npm to install even if written in Rust
    "json-lsp", -- JSON language service. Not available yet in nixpkgs as of Sep 2024. Hence install via mason
    "yaml-language-server", -- Language Server for YAML Files
    -- "zk" -- A plain text note-taking assistant.
  } do
    if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
  end
  -- )))

  -- install other npm-written tools (lsps, linters and formatters) (((
  if vim.fn.executable "awk" == 1 then
    astrocore.list_insert_unique(mason_tools_to_install, { "awk-language-server" }) -- not available in nixpkgs as of Sep 2024, so install with mason
  end

  if vim.fn.executable "bash" == 1 then
    --  astrocore.list_insert_unique(mason_tools_to_install, { "bashls" }) end
    --  astrocore.list_insert_unique(mason_tools_to_install, { "perlnavigator" }) end
    for _, server_cmd in ipairs {
      "bash-language-server", -- requires npm for installing via mason
    } do
      if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
    end
  end

  -- tools written in npm for assisting with docker (((
  if vim.fn.executable "docker" == 1 then
    for _, server_cmd in ipairs {
      "docker-langserver", -- A language server for Dockerfiles powered by Node.js, TypeScript, and VSCode technologies.
    } do
      if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
    end
    if vim.fn.executable "docker-compose" == 1 then
      for _, server_cmd in ipairs {
        "docker-compose-language-server", -- Language service for Docker Compose documents
      } do
        if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
      end
    end
  end
  -- )))

  if vim.fn.executable "git" == 1 then
    for _, linter_formatter_cmd in ipairs {
      "commitlint", --  Lint commit messages
    } do
      if vim.fn.executable(linter_formatter_cmd) == 0 then
        table.insert(mason_tools_to_install, linter_formatter_cmd)
      end
    end
  end

  if vim.fn.executable "vim" == 1 or vim.fn.executable "nvim" == 1 then
    for server, cmd in ipairs {
      vimls = "vim-language-server", -- VImScript language server, LSP for vim script
    } do
      if vim.fn.executable(cmd) == 0 then table.insert(mason_tools_to_install, server) end
    end
  end
  -- )))
end

-- )))

-- tools written in julia (((

if vim.fn.executable "julia" == 1 then
  -- install julia-written LSPs using mason only if not externally installed already and available in PATH
  for _, server_cmd in ipairs {
    "julia-lsp", -- julia-lsp is an easy-install binary through mason. But is pointless without julia executable in PATH
  } do
    if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
  end
end

-- )))

-- tools written in lua (((

if vim.fn.executable "lua" == 1 then
  for _, server_cmd in ipairs {
    "lua-language-server", -- Language server that offers lua support.
  } do
    if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
  end
end

-- )))

-- if vim.fn.executable "luarocks" == 1 then astrocore.list_insert_unique(mason_tools_to_install, { "luacheck" }) end

-- tools that need python3 (((

if vim.fn.executable "python3" == 1 then
  -- install python-written LSPs using mason
  astrocore.list_insert_unique(mason_tools_to_install, {
    -- "textlsp", -- Language server for text spell and grammar check with various tools. Not available in nixpkgs or elsewhere as of Sep 2024
  })

  -- install python-written LSPs using mason only if not externally installed already and available in PATH (((
  for _, server_cmd in ipairs {
    "basedpyright", -- pyright fork with various type checking improvements, improved vscode support and pylance features built into the language server. requires python3 in PATH
    "ruff", -- An extremely fast Python linter and code formatter, written in Rust.
  } do
    if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
  end
  -- )))

  -- general tools that are written in python (((
  for _, linter_formatter_cmd in ipairs {
    "codespell", -- check code for common misspellings
  } do
    if vim.fn.executable(linter_formatter_cmd) == 0 then table.insert(mason_tools_to_install, linter_formatter_cmd) end
  end
  -- )))

  -- tools written in python but used for editing bash scripts (((

  -- if vim.fn.executable "sh" == 1 or vim.fn.executable "bash" == 1 then
  --   for _, linters_formatter_cmd in ipairs {
  --     -- beautysh = "beautysh", -- A Bash beautifier for the masses. Deprecated by none-ls. Available in https://github.com/nvimtools/none-ls-extras.nvim
  --   } do
  --     if vim.fn.executable(linters_formatter_cmd) == 0 then
  --       table.insert(mason_tools_to_install, linter_formatter)
  --     end
  --   end
  -- end

  -- )))

  -- tools written in python but used for editing cmake scripts (((

  if vim.fn.executable "cmake" == 1 then
    for _, linter_formatter_cmd in ipairs {
      "cmakelint", -- cmakelint parses CMake files and reports style issues.
    } do
      if vim.fn.executable(linter_formatter_cmd) == 0 then
        table.insert(mason_tools_to_install, linter_formatter_cmd)
      end
    end
    -- astrocore.list_insert_unique(mason_tools_to_install, { "cmake_format", "cmakelint", "gersemi" })
  end

  -- )))

  -- tools written in python but used for editing fortran source code (((

  if vim.fn.executable "gfortran" == 1 or vim.fn.executable "lfortran" == 1 then
    for _, server_cmd in ipairs {
      "fortls", -- Fortran Language Server
    } do
      if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
    end
  end

  -- )))

  -- tools written in python but also need cargo/rustc (((

  -- if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" == 1 then
  --   astrocore.list_insert_unique(mason_tools_to_install, { "shellharden" })
  --   astrocore.list_insert_unique(mason_tools_to_install, "pylyzer")
  -- end

  -- )))

  -- astrocore.list_insert_unique(mason_tools_to_install, "sourcery")

  -- tools that also need pip or conda (((
  -- if vim.fn.executable "pip3" == 1 or vim.fn.executable "conda" == 1 or vim.fn.executable "mamba" == 1 then
  --   astrocore.list_insert_unique(daps_to_install, { "debugpy" })
  --   astrocore.list_insert_unique(mason_tools_to_install, { "pyre" })
  --   astrocore.list_insert_unique(mason_tools_to_install, { "pylsp" })
  --   astrocore.list_insert_unique(mason_tools_to_install, {
  --     "autoflake",
  --     "clang_format",
  --     "codespell",
  --     "flake8",
  --     "gitlint",
  --     "mdformat",
  --     "proselint",
  --     "pydocstyle",
  --     "pylama",
  --     "reorder_python_imports",
  --     "usort",
  --     "vint",
  --     "vulture",
  --     "yamlfix",
  --     "yamllint",
  --     -- "mypy",
  --     -- "pylint",
  --     -- "pyproject_flake8",
  --   })
  -- end
  -- )))
end

-- )))

-- tools written in rust and that requires ructc and cargo (((

-- astrocore.list_insert_unique(mason_tools_to_install, { "asm_lsp", "nil_ls" })
if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  -- tools written in rust that are binary-installable (((
  for _, server_cmd in ipairs {
    "rust-analyzer", -- Modular compiler frontend for the Rust language. Written in Rust. But actually has no dependency on rust being available in PATH. It is an easy binary install via mason. Just doing conditional installation because there is no use for rust-analyzer without rustc available in PATH
  } do
    if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
  end
  -- )))

  -- tools written in rust that requires rustc/cargo and helpful tools for editing bash scripts  (((
  if vim.fn.executable "sh" == 1 or vim.fn.executable "bash" == 1 then
    for _, linter_formatter_cmd in ipairs {
      "shellharden", -- Hardens shell scripts by quoting variables, replacing function_call with $(function_call), and more.
    } do
      if vim.fn.executable(linter_formatter_cmd) == 0 then
        table.insert(mason_tools_to_install, linter_formatter_cmd)
      end
    end
  end
  -- )))

  -- tools written in rust that requires rustc and for editing cmake source code  (((
  if vim.fn.executable "cmake" == 1 then
    for _, server_cmd in ipairs {
      "neocmakelsp", -- have to use the name in https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#neocmake. CMake LSP implementation based on Tower and Tree-sitter. Written in Rust
    } do
      if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
    end
  end

  -- )))
end

-- )))

-- if vim.fn.executable "dotnet" == 1 then astrocore.list_insert_unique(mason_tools_to_install, { "omnisharp" }) end
-- if vim.fn.executable "r" then astrocore.list_insert_unique(mason_tools_to_install, { "r_language_server" }) end

-- )))

---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  -- lazy = false,
  opts = {
    -- add more things to the ensure_installed table protecting against community packs modifying it
    ensure_installed = mason_tools_to_install,
    integrations = {
      ["mason-lspconfig"] = false,
      ["mason-nvim-dap"] = false,
    },
  },
}

-- -- Language Servers
-- "ansible-language-server",
-- "astro-language-server",
-- "css-lsp",
-- "dockerfile-language-server",
-- "gopls",
-- "haskell-language-server",
-- "html-lsp",
-- "json-lsp",
-- "regols",
-- "svelte-language-server",
-- "tailwindcss-language-server",
-- "vtsls",
--
-- -- Linters
-- "ansible-lint",
-- "sqlfluff",
--
-- -- Formatters
-- "prettier",
--
-- -- Debuggers
-- "bash-debug-adapter",
-- "cpptools",
-- "debugpy",
-- "delve",
-- "haskell-debug-adapter",
-- "js-debug-adapter",
-- "php-debug-adapter",
--
-- -- Other Tools
-- "tree-sitter-cli",
--
