-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:
-- Last FULL review on Mar 6, 2025

local mason_tools_to_install = {}

-- lsp servers for general purpose editing. All these lsps are easy binary-available, but should be installed with mason only if they have not already been installed externally & made available in PATH
for _, server_cmd in ipairs {
  "harper-ls", -- The Grammar Checker for Developers. Written in Rust. Requires a modern GLIBC
  "ltex-ls", -- LSP language server for LanguageTool with support for LaTeX, Markdown, and others. Written in Kotlin
  "markdown-oxide", -- Robust, Minimalist, Unbundled PKM. Written in Rust. Requires a new-ish glibc
  "marksman", -- code assist & intelligence for markdown/text buffers. Written in F#. Too difficult on hpcs
  "prosemd-lsp", -- An experimental proofreading & linting LSP for markdown files. Written in Rust
  "pylyzer", -- A fast, feature-rich static code analyzer & language server for Python. Written in Rust
  "taplo", -- TOML toolkit written in Rust. Is a direct download. Does not need rustc/cargo
  "trivy", -- Find vulnerabilities, misconfigurations, secrets, SBOM in various places. Written in GoLang
  "vale-ls", -- LSP implementation for the Vale command-line tool. Written in Rust. Requires a modern GLIBC
  "zk", -- A plain text note-taking assistant. Written in GoLang
  -- "ast-grep", -- to study and look at this tool further
  -- "sonarlint-ls", -- nvim_lsp server config not available Sep 2024 (check whether easily binary-installable)
  -- "typos-lsp", -- Source code spell checker. Written in Rust. Requires a modern GLIBC
} do
  if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
end

-- install easily binary-installable linters & formatters that are not already in PATH (((
for _, linter_formatter_cmd in ipairs {
  "actionlint", -- Static checker for GitHub Actions workflow files. Written in GoLang
  "checkmake", -- experimental linter/analyzer for Makefiles
  "mdsf", -- Format markdown code blocks using your favorite tools. Written in Rust
  "mdslw", -- Prepare your markdown for easy diff'ing!. Written in Rust
  "selene", -- A blazing-fast modern Lua linter written in Rust
  "shfmt", -- A shell parser, formatter, and interpreter with bash support; includes shfmt
  "stylua",
  "yamlfmt", -- An extensible command line tool or library to format yaml files. Written in GoLang
  -- "astyle",
  -- "cbfmt",
  -- "editorconfig-checker",
  -- "hadolint", -- written in haskell
  -- "markuplint", -- html linter. not in brew or nixpkgs as of Sep 2024. Install with mason
  -- "shellcheck", -- ShellCheck, a static analysis tool for shell scripts. Deprecated in none-ls
  -- "vacuum",
  -- "vale",
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

-- tools written in c/c++ (((
if
  vim.fn.executable "clang++" == 1
  or vim.fn.executable "g++" == 1
  or vim.fn.executable "clang" == 1
  or vim.fn.executable "gcc" == 1
  or vim.fn.executable "cc" == 1
then
  for _, server_cmd in ipairs {
    "clangd", -- clangd understands your C++ code & adds smart features to your editor
  } do
    if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
  end
end
-- )))

-- tools written in go-language (((
-- if vim.fn.executable "go" == 1 then
--   astrocore.list_insert_unique(mason_tools_to_install, { "buf", "bufls", "misspell", "protolint", "sqls" })
-- end
-- )))

-- tools written in javascript & requires npm (((
if vim.fn.executable "npm" == 1 then
  -- install (via mason) general npm-written LSPs not available in PATH (((
  astrocore.list_insert_unique(mason_tools_to_install, {
    -- "html"
    -- "intelephense"
    -- "tsserver"
  })
  -- )))

  -- install (via mason) ansible LSP (written in typescript & requires npm) if it is not available in PATH (((
  if vim.fn.executable "ansible" == 1 then
    if vim.fn.executable "ansible-language-server" == 0 then
      table.insert(mason_tools_to_install, "ansible-language-server")
    end
  end

  -- install general npm-written linters and formatters not available in PATH via mason (((
  astrocore.list_insert_unique(mason_tools_to_install, {
    -- "cpplint", -- Cpplint is a command-line tool to check C/C++ files for style issues following Google's C++ style guide. Problematic nixpkgs build as of Sep 2024. cpplint has been deprecated in none-ls.
    -- "cspell", -- A Spell Checker for Code! Deprecated in none-ls
    -- "fixjson",
  })
  -- )))

  -- install npm-written LSPs not available in PATH via mason (((
  for _, npm_written_lsp_linter_formatter_cmd in ipairs {
    "alex", -- Catch insensitive, inconsiderate writing (for Markdown files)
    "biome", -- Formatter and linter, usable via CLI and LSP. Requires npm to install even if written in Rust
    "doctoc", -- Generates TOC for markdown files of local git repo
    "json-lsp", -- JSON LSP extracted from VSCode to be reused.
    "markdown-toc", -- API/CLI for generating a markdown TOC for any markdown file
    "markdownlint-cli2", -- Fast, flexible, config-based CLI for linting Markdown/CommonMark
    "prettierd", -- prettier, as a daemon, for improved formatting speed.
    "remark-language-server", -- An LSP to lint and format markdown files with remark. Written in Nodejs
    "textlint", -- The pluggable natural language linter for text and markdown
    "vim-language-server", -- VimScript language server, LSP for vim script.
    "write-good", -- Naive linter for English prose
    "yaml-language-server", -- Language Server for YAML Files.
  } do
    if vim.fn.executable(npm_written_lsp_linter_formatter_cmd) == 0 then
      table.insert(mason_tools_to_install, npm_written_lsp_linter_formatter_cmd)
    end
  end
  -- )))

  -- install other npm-written tools (lsps, linters and formatters) (((
  if vim.fn.executable "awk" == 1 then
    for _, server_cmd in ipairs {
      "awk-language-server", -- requires npm for installing via mason
    } do
      if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
    end
  end

  if vim.fn.executable "bash" == 1 then
    --  astrocore.list_insert_unique(mason_tools_to_install, { "perlnavigator" }) end
    for _, server_cmd in ipairs {
      "bash-language-server", -- requires npm for installing via mason
    } do
      if vim.fn.executable(server_cmd) == 0 then table.insert(mason_tools_to_install, server_cmd) end
    end
  end

  -- tools written in npm for assisting with docker (((
  if vim.fn.executable "docker" == 1 then
    if vim.fn.executable "docker-langserver" == 0 then
      table.insert(mason_tools_to_install, "dockerfile-language-server")
    end
    if vim.fn.executable "docker-compose" == 1 then
      if vim.fn.executable "docker-compose-language-service" == 0 then
        table.insert(mason_tools_to_install, "docker-compose-language-service")
      end -- Language service for Docker Compose documents
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

  -- if vim.fn.executable "vim" == 1 or vim.fn.executable "nvim" == 1 then
  for server, cmd in ipairs {
    vimls = "", -- VImScript language server, LSP for vim script
  } do
    if vim.fn.executable(cmd) == 0 then table.insert(mason_tools_to_install, server) end
  end
  -- end
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

if vim.fn.executable "python3" == 1 and vim.fn.executable "virtualenv" == 1 then
  -- install LSPs written in python using mason-tool-installer
  astrocore.list_insert_unique(mason_tools_to_install, {
    -- "textlsp", -- Language server for text spell and grammar check with various tools. Not available in nixpkgs or elsewhere as of Sep 2024
  })

  -- install python-written LSPs for editing python (& general) files (but only if not already available in PATH) (((
  for _, python_lsp_linter_formatter_tool_cmd in ipairs {
    "autopep8", -- Automatically formats Python code to conform to the PEP 8 style guide. Written in Python
    "bandit", -- Tool designed to find common security issues in Python code. Written in Python
    "basedpyright", -- Pyright fork with various improvements built into the lsp. Written in Python
    "black", -- The uncompromising Python code formatter. Written in Python
    "blue", -- The slightly less uncompromising Python code formatter. Written in Python
    "darker", -- Apply black reformatting to Python files only in regions changed since a given commit. Written in Python
    "docformatter", -- Formats docstrings to follow PEP 257. Written in Python
    "jupytext", -- Jupyter Notebooks as Markdown Documents, Julia, Python or R scripts. Written in Python
    "mypy", -- Optional static typing for Python. Written in Python
    "pyink", -- Python formatter, forked from Black with a few different formatting behaviors. Written in Python
    "pylama", -- Code audit tool for Python and JavaScript. Written in Python
    "ruff", -- An extremely fast Python linter and code formatter, written in Rust.
    "sphinx-lint", -- Check for stylistic & formal issues in .rst & .py files in documentation. Written in Python
    "usort", --Safe, minimal import sorting for Python projects. Written in Python
    "vulture", -- Find dead Python code. Written in Python
    "yamlfix", -- A simple opinionated yaml formatter that keeps your comments! Written in Python
    "yamllint", -- A linter for YAML files. Written in Python
  } do
    if vim.fn.executable(python_lsp_linter_formatter_tool_cmd) == 0 then
      table.insert(mason_tools_to_install, python_lsp_linter_formatter_tool_cmd)
    end
  end
  -- )))

  -- general tools that are written in python (((
  for _, python_based_genpurpose_linter_formatter_cmd in ipairs {
    "codespell", -- check code for common misspellings
    "mdformat", -- CommonMark compliant Markdown formatter
    "proselint", -- A linter for prose
    "pymarkdownlnt", -- A GitHub Flavored Markdown compliant Markdown linter.
  } do
    if vim.fn.executable(python_based_genpurpose_linter_formatter_cmd) == 0 then
      table.insert(mason_tools_to_install, python_based_genpurpose_linter_formatter_cmd)
    end
  end
  -- )))

  -- tools written in python but used for editing ansible-related files (((

  if vim.fn.executable "ansible" == 1 then
    for _, linter_formatter_cmd in ipairs {
      "ansible-lint", -- command-line tool for linting playbooks, roles and collections aimed toward any ansible users.
    } do
      if vim.fn.executable(linter_formatter_cmd) == 0 then
        table.insert(mason_tools_to_install, linter_formatter_cmd)
      end
    end
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

  -- tools written in python for editing c/c++ code (((
  if
    vim.fn.executable "clang++" == 1
    or vim.fn.executable "g++" == 1
    or vim.fn.executable "clang" == 1
    or vim.fn.executable "gcc" == 1
    or vim.fn.executable "cc" == 1
  then
    for _, formatter_cmd in ipairs {
      "clang-format", -- Formatter for C/C++ code. Written in Python
    } do
      if vim.fn.executable(formatter_cmd) == 0 then table.insert(mason_tools_to_install, formatter_cmd) end
    end
  end
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
    -- astrocore.list_insert_unique(mason_tools_to_install, { "cmake_format", "gersemi" })
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

  -- tools written in rust that requires rustc/cargo and for editing bash scripts  (((
  if vim.fn.executable "sh" == 1 or vim.fn.executable "bash" == 1 then
    for _, linter_formatter_cmd in ipairs {
      "shellharden", -- Hardens shell scripts by quoting variables, replacing function_call with $(function_call), etc
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

  -- tools written in rust that requires rustc and for editing typst source code  (((
  if vim.fn.executable "typst" == 1 then
    for _, server_cmd in ipairs {
      "tinymist", --  Tinymist [ˈtaɪni mɪst] is an integrated language service for Typst [taɪpst].
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
  dependencies = { "williamboman/mason.nvim" },
  -- lazy = false,
  opts = {
    -- add more things to the ensure_installed table protecting against community packs modifying it
    ensure_installed = mason_tools_to_install,
  },
}

-- "astro-language-server",
-- "autoflake",
-- "bash-debug-adapter",
-- "cpptools",
-- "css-lsp",
-- "debugpy",
-- "flake8",
-- "gitlint",
-- "gopls",
-- "haskell-debug-adapter",
-- "haskell-language-server",
-- "html-lsp",
-- "js-debug-adapter",
-- "php-debug-adapter",
-- "pydocstyle",
-- "pylint",
-- "pyproject_flake8",
-- "regols",
-- "reorder_python_imports",
-- "sourcery"
-- "sqlfluff",
-- "svelte-language-server",
-- "tailwindcss-language-server",
-- "vint",
-- "vtsls",
