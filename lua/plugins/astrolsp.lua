-- ╭─────────────────────────────────────────────────────────╮
-- │ AstroLSP allows you to customize the features in        │
-- │ AstroNvim's LSP configuration engine Configuration      │
-- │ documentation can be found with `:h astrolsp`           │
-- │ NOTE: We highly recommend setting up the Lua Language   │
-- │ Server (`:LspInstall lua_ls`) as this provides          │
-- │ autocomplete and documentation while editing            │
-- ╰─────────────────────────────────────────────────────────╯

-- https://code.mehalter.com/AstroNvim_user/~files/v5/lua/plugins/astrolsp.lua
-- use the server name in https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {} -- only add local servers if their commands are available
for server, cmd in pairs {
  -- ast_grep = "ast-grep", -- to study and look at this tool further
  -- sonarlint_ls = "sonarlint-ls", -- nvim_lsp server config not available Sep 2024 (check whether easily binary-installable)
  basedpyright = "basedpyright", -- pyright fork with various type improvements. Requires python3 in PATH
  bashls = "bash-language-server", -- requires npm for installing via mason
  biome = "biome", -- A toolchain for web projects. Biome offers formatter and linter, usable via CLI and LSP.
  clangd = "clangd", -- clangd understands your C++ code & adds smart features to your editor
  docker_compose_language_service = "docker-compose-language-server", -- Language service for Docker Compose documents
  dockerls = "docker-langserver", -- A language server for Dockerfiles powered by Node.js, TypeScript, and VSCode technologies.
  fortls = "fortls", -- Fortran Language Server
  harper_ls = "harper-ls", -- The Grammar Checker for Developers. Written in Rust
  julials = "julia", -- The Julia Programming Language language server
  lua_ls = "lua-language-server", -- Language server that offers lua support. (dependent on lua in PATH?)
  markdown_oxide = "markdown-oxide", -- Robust, Minimalist, Unbundled PKM for your favorite text-editor through the LSP
  marksman = "marksman", -- Write Markdown with code assist & intelligence. Written in F#
  neocmake = "neocmakelsp", -- use name in github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#neocmake.
  ruff = "ruff", -- An extremely fast Python linter and code formatter, written in Rust.
  rust_analyzer = "rust-analyzer", -- Modular compiler frontend for the Rust language. Written in Rust
  taplo = "taplo", -- TOML toolkit written in Rust
  typos_lsp = "typos-lsp", -- Source code spell checker. Written in Rust
  vale_ls = "vale-ls", -- LSP implementation for the Vale command-line tool. Written in Rust
  vimls = "vim-language-server", -- VImScript language server, LSP for vim script
  yamlls = "yaml-language-server", -- Language Server for YAML Files
} do
  if vim.fn.executable(cmd) == 1 then table.insert(servers, server) end
end

---@type LazySpec
return {
  "AstroNvim/astrolsp", -- LSP Configuration Engine built for AstroNvim
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
      signature_help = true,
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      no_insert_inlay_hints = {
        cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
        {
          event = "InsertEnter",
          desc = "disable inlay hints on insert",
          callback = function(args)
            local filter = { bufnr = args.buf }
            if vim.lsp.inlay_hint.is_enabled(filter) then
              vim.lsp.inlay_hint.enable(false, filter)
              vim.api.nvim_create_autocmd("InsertLeave", {
                buffer = args.buf,
                once = true,
                callback = function() vim.lsp.inlay_hint.enable(true, filter) end,
              })
            end
          end,
        },
      },
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      -- lsp_codelens_refresh = {
      --   -- Optional condition to create/delete auto command group
      --   -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
      --   -- condition will be resolved for each client on each execution and if it ever fails for all clients,
      --   -- the auto commands will be deleted for that buffer
      --   cond = "textDocument/codeLens",
      --   -- cond = function(client, bufnr) return client.name == "lua_ls" end,
      --   -- list of auto commands to set
      --   {
      --     -- events to trigger
      --     event = { "InsertLeave", "BufEnter" },
      --     -- the rest of the autocmd options (:h nvim_create_autocmd)
      --     desc = "Refresh codelens (buffer)",
      --     callback = function(args)
      --       if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
      --     end,
      --   },
      --   {
      --     event = { "CursorMoved", "CursorMovedI", "BufLeave" },
      --     desc = "Document Highlighting Clear",
      --     callback = function() vim.lsp.buf.clear_references() end,
      --   },
      -- },
    },
    -- enable servers that you already have installed without mason
    servers = servers,
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      ---@diagnostic disable: missing-fields
      basedpyright = {
        before_init = function(_, c)
          if not c.settings then c.settings = {} end
          if not c.settings.python then c.settings.python = {} end
          c.settings.python.pythonPath = vim.fn.exepath "python"
        end,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
            },
          },
        },
      },
      clangd = {
        capabilities = { offsetEncoding = "utf-8", memoryUsageProvider = true },
        filetypes = { "c", "cpp", "cuda", "objc", "objcpp", "proto" },
        init_options = {
          clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
          usePlaceholders = true,
          completeUnimported = true,
          semanticHighlighting = true,
        },
        cmd = {
          "clangd",
          -- SEE: clangd --help-hidden for possible options
          -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
          -- to add more `checks`, create  a `.clang-tidy` file in the root directory
          -- SEE: https://clang.llvm.org/extra/clang-tidy
          "--all-scopes-completion",
          "--background-index",
          "--clang-tidy",
          -- "--completion-style=bundled",
          "--completion-style=detailed",
          "--enable-config",
          -- "--cross-file-rename", -- obsolete
          -- "--fallback-style=webkit",
          "--function-arg-placeholders",
          "--header-insertion=iwyu",
          "--header-insertion-decorators",
          "--malloc-trim",
          -- "--suggest-missing-includes", -- obsolete
        },
      },
      gdscript = { cmd = { "ncat", "127.0.0.1", "6008" } },
      gopls = {
        settings = {
          gopls = {
            codelenses = {
              generate = true, -- show the `go generate` lens.
              gc_details = true, -- Show a code lens toggling the display of gc's choices.
              test = true,
              tidy = true,
              vendor = true,
              regenerate_cgo = true,
              upgrade_dependency = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            semanticTokens = true,
          },
        },
      },
      julials = {
        on_new_config = function(new_config)
          local found_shim
          for _, depot in
            ipairs(
              vim.env.JULIA_DEPOT_PATH and vim.split(vim.env.JULIA_DEPOT_PATH, vim.fn.has "win32" == 1 and ";" or ":")
                or { vim.fn.expand "~/.julia" }
            )
          do
            local bin = vim.fs.joinpath(depot, "environments", "nvim-lspconfig", "bin", "julia")
            local file = (vim.uv or vim.loop).fs_stat(bin)
            if file and file.type == "file" then
              found_shim = bin
              break
            end
          end
          if found_shim then
            new_config.cmd[1] = found_shim
          else
            new_config.autostart = false -- only auto start if sysimage is available
          end
        end,
        on_attach = function(client)
          local environment = vim.tbl_get(client, "settings", "julia", "environmentPath")
          if environment then client.notify("julia/activateenvironment", { envPath = environment }) end
        end,
        settings = {
          julia = {
            completionmode = "qualify",
            lint = {
              missingrefs = "none",
            },
          },
        },
      },
      lua_ls = { settings = { Lua = { hint = { enable = true, arrayIndex = "Disable" } } } },
      ltex = {
        -- enabled = false,
        -- enabled = { "bibtex", "context", "context.tex", "html", "latex", "markdown", "org", "restructuredtext", "rsweave" },
        language = "en-GB",
        -- language = "fr",
      },
      markdown_oxide = { capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } } },
      metals = {
        settings = {
          inlayHints = {
            hintsInPatternMatch = { enable = true },
            implicitArguments = { enable = true },
            implicitConversions = { enable = true },
            inferredTypes = { enable = true },
            typeParameters = { enable = true },
          },
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "strict",
            },
          },
        },
      },
      pylsp = { -- https://gitlab.com/HiPhish/nvim-config/-/blob/master/plugin/lsp.lua
        plugins = {
          -- If this plugin does not work try running MyPy from the command line first
          pylsp_mypy = {
            enabled = true,
            live_mode = true,
          },
        },
      },
      ruff = { on_attach = function(client) client.server_capabilities.hoverProvider = false end },
      taplo = { evenBetterToml = { schema = { catalogs = { "https://www.schemastore.org/api/json/catalog.json" } } } },
      texlab = {
        settings = {
          texlab = {
            -- bibtexFormatter = "latexindent",
            build = {
              executable = "", -- disable this since we are using vimtex
            },
            -- chktex = {
            --   onOpenAndSave = true,
            --   onEdit = true,
            -- },
            diagnosticsDelay = 600,
            -- formatterLineLength = 80,
            -- latexindent = {
            --   modifyLineBreaks = true,
            -- },
          },
        },
      },
      tsserver = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            },
          },
        },
      },
      typos_lsp = { single_file_support = false },
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = false },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true, suppressWhenTypeMatchesName = false },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
            updateImportsOnFileMove = { enabled = "always" },
          },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = false },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true, suppressWhenTypeMatchesName = false },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
            updateImportsOnFileMove = { enabled = "always" },
          },
        },
      },
    },
    formatting = { -- control auto formatting on save (customize lsp formatting options)
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        -- allow_filetypes will take precedence over ignore_filetypes. So please only use one of these options at a time
        -- allow_filetypes = { -- enable format on save for specified filetypes only
        --   "go",
        -- },
        ignore_filetypes = { -- disable format on save for specified filetypes
          "julia",
          "python",
          "text",
          -- "cmake",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        "clangd",
        "cmake",
        "jsonls",
        "neocmake",
        "neocmakelsp",
        "pylsp",
        "python_lsp_server",
        "taplo",
        -- "lua_ls", -- disable lua_ls formatting capability if you want to use stylua to format your lua code
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   -- only enable null-ls for javascript files
      --   -- if vim.bo.filetype == "javascript" then return client.name == "null-ls" end
      --   if vim.bo.filetype == "cmake" then return client.name == "null-ls" end
      --   return true -- enable all other clients
      -- end,
    },
    -- handlers = { -- customize how language servers are attached
    --   -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
    --   function(server, opts) require("lspconfig")[server].setup(opts) end
    --
    --   -- the key is the server that is being setup with `lspconfig`
    --   rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
    --   pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end, -- or a custom handler function can be passed
    -- },
    -- mappings = { -- mappings to be set up on attaching of a language server
    --   n = {
    --     -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
    --     ["<Leader>uY"] = {
    --       function() require("astrolsp.toggles").buffer_semantic_tokens() end,
    --       desc = "Toggle LSP semantic highlight (buffer)",
    --       cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
    --     },
    --   },
    --   i = {
    --     ["<C-l>"] = {
    --       function() vim.lsp.buf.signature_help() end,
    --       desc = "Signature help",
    --       cond = "textDocument/signatureHelp",
    --     },
    --   },
    -- },
    -- custom `on_attach` to run after default `on_attach`. Takes two parameters `client` & `bufnr`  (`:h lspconfig-setup`)
    -- on_attach = function(client, bufnr)
    --   client.server_capabilities.semanticTokensProvider = nil -- disable semanticTokensProvider for all clients
    -- end,
  },
}
