-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:

local utils = require "astronvim.utils"

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
  -- if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  --   utils.list_insert_unique(lsps_to_install, "pylyzer")
  -- end
  if vim.fn.executable "npm" == 1 then
    utils.list_insert_unique(lsps_to_install, "pyright")
  end

  if vim.fn.executable "pip3" == 1 or vim.fn.executable "conda" == 1 or vim.fn.executable "mamba" == 1 then
    utils.list_insert_unique(daps_to_install, "debugpy")
    utils.list_insert_unique(lsps_to_install, { "pyre" })
    utils.list_insert_unique(linters_formatters_to_install, {
      "autoflake",
      "beautysh",
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
      "yamlfix",
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
if vim.fn.executable "rustc" == 1 and vim.fn.executable "cargo" then
  utils.list_insert_unique(lsps_to_install, { "asm_lsp", "taplo" })
end

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
    enabled = vim.fn.has "win32" == 0,
    opts = {
      ensure_installed = daps_to_install,
      handlers = {
        require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "c", "cpp" } }),
        js = function()
          local dap = require "dap"
          dap.adapters["pwa-node"] = {
            type = "server",
            port = "${port}",
            executable = { command = vim.fn.exepath "js-debug-adapter", args = { "${port}" } },
          }

          local pwa_node_attach = {
            type = "pwa-node",
            request = "launch",
            name = "js-debug: Attach to Process (pwa-node)",
            proccessId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          }
          local function deno(cmd)
            cmd = cmd or "run"
            return {
              request = "launch",
              name = ("js-debug: Launch Current File (deno %s)"):format(cmd),
              type = "pwa-node",
              program = "${file}",
              cwd = "${workspaceFolder}",
              runtimeExecutable = vim.fn.exepath "deno",
              runtimeArgs = { cmd, "--inspect-brk" },
              attachSimplePort = 9229,
            }
          end
          local function typescript(args)
            return {
              type = "pwa-node",
              request = "launch",
              name = ("js-debug: Launch Current File (ts-node%s)"):format(
                args and (" " .. table.concat(args, " ")) or ""
              ),
              program = "${file}",
              cwd = "${workspaceFolder}",
              runtimeExecutable = "ts-node",
              runtimeArgs = args,
              sourceMaps = true,
              protocol = "inspector",
              console = "integratedTerminal",
              resolveSourceMapLocations = {
                "${workspaceFolder}/dist/**/*.js",
                "${workspaceFolder}/**",
                "!**/node_modules/**",
              },
            }
          end
          for _, language in ipairs { "javascript", "javascriptreact" } do
            dap.configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "js-debug: Launch File (pwa-node)",
                program = "${file}",
                cwd = "${workspaceFolder}",
              },
              deno "run",
              deno "test",
              pwa_node_attach,
            }
          end
          for _, language in ipairs { "typescript", "typescriptreact" } do
            dap.configurations[language] = {
              typescript(),
              typescript { "--esm" },
              deno "run",
              deno "test",
              pwa_node_attach,
            }
          end
        end,
      },
    },
  },
}
-- )))
