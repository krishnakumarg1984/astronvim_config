-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- ╭─────────────────────────────────────────────────────────╮
-- │ AstroLSP allows you to customize the features in        │
-- │ AstroNvim's LSP configuration engine Configuration      │
-- │ documentation can be found with `:h astrolsp`           │
-- │ NOTE: We highly recommend setting up the Lua Language   │
-- │ Server (`:LspInstall lua_ls`) as this provides          │
-- │ autocomplete and documentation while editing            │
-- ╰─────────────────────────────────────────────────────────╯

-- https://code.mehalter.com/AstroNvim_user/~files/master/lua/plugins/astrolsp.lua
local servers = {} -- only add local servers if their commands are available
for server, cmd in pairs { julials = "julia" } do
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
      -- inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
      signature_help = true,
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        -- If you have allow_filetypes it will take precedence over ignore_filetypes. So please only use one of these options at a time
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          "julia",
          "text",
          -- "cmake",
          "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        "clangd",
        "cmake",
        "jsonls",
        "neocmakelsp",
        "neocmake",
        "pylsp",
        "python_lsp_server",
        -- "lua_ls", -- disable lua_ls formatting capability if you want to use stylua to format your lua code
        "taplo",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   -- only enable null-ls for javascript files
      --   -- if vim.bo.filetype == "javascript" then return client.name == "null-ls" end
      --   if vim.bo.filetype == "cmake" then return client.name == "null-ls" end

      --   -- enable all other clients
      --   return true
      -- end,
      -- timeout_ms = 1000, -- default format timeout
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
              stubPath = vim.env.HOME .. "/typings",
              diagnosticSeverityOverrides = {
                reportUnusedImport = "information",
                reportUnusedFunction = "information",
                reportUnusedVariable = "information",
                reportGeneralTypeIssues = "none",
                reportOptionalMemberAccess = "none",
                reportOptionalSubscript = "none",
                reportPrivateImportUsage = "none",
              },
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
          -- check for nvim-lspconfig julia sysimage shim
          local julia = (vim.env.JULIA_DEPOT_PATH or vim.fn.expand "~/.julia")
            .. "/environments/nvim-lspconfig/bin/julia"
          if require("lspconfig").util.path.is_file(julia) then
            new_config.cmd[1] = julia
          else
            new_config.autostart = false -- only auto start if sysimage is available
          end
        end,
        settings = {
          julia = {
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
    -- customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- Configure buffer local auto commands to add when attaching a language server
    -- autocmds = {
    --   -- first key is the `augroup` to add the auto commands to (:h augroup)
    --   -- lsp_codelens_refresh = {
    --   --   -- Optional condition to create/delete auto command group
    --   --   -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
    --   --   -- condition will be resolved for each client on each execution and if it ever fails for all clients,
    --   --   -- the auto commands will be deleted for that buffer
    --   --   cond = "textDocument/codeLens",
    --   --   -- cond = function(client, bufnr) return client.name == "lua_ls" end,
    --   --   -- list of auto commands to set
    --   --   {
    --   --     -- events to trigger
    --   --     event = { "InsertLeave", "BufEnter" },
    --   --     -- the rest of the autocmd options (:h nvim_create_autocmd)
    --   --     desc = "Refresh codelens (buffer)",
    --   --     callback = function(args)
    --   --       if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
    --   --     end,
    --   --   },
    --   --   {
    --   --     event = { "CursorMoved", "CursorMovedI", "BufLeave" },
    --   --     desc = "Document Highlighting Clear",
    --   --     callback = function() vim.lsp.buf.clear_references() end,
    --   --   },
    --   -- },
    -- },
    -- mappings to be set up on attaching of a language server
    mappings = {
      -- n = {
      --   -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
      --   -- ["<Leader>uY"] = {
      --   --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
      --   --   desc = "Toggle LSP semantic highlight (buffer)",
      --   --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
      --   -- },
      -- },
      -- i = {
      --   ["<C-l>"] = {
      --     function() vim.lsp.buf.signature_help() end,
      --     desc = "Signature help",
      --     cond = "textDocument/signatureHelp",
      --   },
      -- },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    -- on_attach = function(client, bufnr)
    --   -- this would disable semanticTokensProvider for all clients
    --   -- client.server_capabilities.semanticTokensProvider = nil
    -- end,
  },
}

-- Some notes on project-specific auto formatting (((

-- https://discord.com/channels/939594913560031363/939857762043695165/1030514633775255683
-- like you want to disable a specific project from auto formatting?
-- in your vimrc.lua file that gets loaded you just need to set vim.g.autoformat_enabled = false
-- that will stop the auto formatter from running on start up
-- But to  note, lsp.formatting.format_on_save needs to be enabled for this variable to do anything (this is described in the docs and in the user_example)
-- or you can just disable it all together
-- but if you do vim.g.autoformat_enabled = false you still have the option once you are running AstroNvim to do <leader>uf to toggle the auto formatting on and then back off
-- autoformat_enabled variable just controls the toggling startup value when the auto formatter is enabled

-- )))
