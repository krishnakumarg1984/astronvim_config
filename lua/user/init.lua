-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local config = {

  colorscheme = "default_theme",   -- Set colorscheme

  -- Default theme configuration (((

  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  --- )))

  -- Disable default plugins (((

  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = false,
    indent_blankline = true,
    dashboard = false,
    which_key = true,
    neoscroll = true,
    ts_rainbow = false,
    ts_autotag = true,
  },

  -- )))

  -- Disable AstroNvim ui features (((

  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- )))

  -- Configure plugins (((
  plugins = {
    init = function(default_plugins)
      local my_plugins = {
        -- custom plugins go here
        -- Add plugins, the packer syntax without the "use"
        -- { "ziontee113/syntax-tree-surfer", module = "syntax-tree-surfer" },
        -- { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
        -- { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } },
        { "tyru/capture.vim", cmd = { "Capture" } },
        { "kenn7/vim-arsync", cmd = { "ARshowConf", "ARsyncUp", "ARsyncUpDelete", "ARsyncDown" } },
        { "tpope/vim-unimpaired", keys = { "[", "]" } }, -- e (exchange), ob (background), oc (cursorline), od (diff), oh (hlsearch), oi (ignorecase), ol (list), on (number), or (relativenumber), os (spell), ot (colorcolumn), ou (cursorcolumn), ov (virtualedit), ow (wrap), ox (cursorline cursorcolumn), u (encode/decode urls), y (C-string style escaping), n (conflict marker), a (args), b (buffers), l (location), q (quickfix), t (tag), >p Paste after linewise, increasing indent, >P (Paste before linewise, increasing indent), <p (Paste after linewise, decreasing indent), <P (Paste before linewise, decreasing indent), =p (Paste after linewise, reindenting), =P (Paste before linewise, reindenting), x<motion> (xml encode/decode)
        { "lervag/vimtex", ft = "tex" },
        { "svban/YankAssassin.vim" },
        { "sudormrfbin/cheatsheet.nvim", cmd = { "Cheatsheet", "CheatsheetEdit" } },
        { "p00f/clangd_extensions.nvim", ft = { "c", "cpp", "cuda" } },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }, -- cmdline completions
        { "ellisonleao/glow.nvim", ft = { "markdown", "lsp_markdown", "rmd" }, cmd = { "Glow", "GlowInstall" } },
        {
          "echasnovski/mini.nvim",
          config = function()
            require("mini.surround").setup()
          end,
        },
        {
          "Shatur/neovim-cmake",
          ft = { "c", "cpp", "cmake", "fortran" },
          requires = { "mfussenegger/nvim-dap" },
          config = function()
            require("cmake").setup({})
          end,
        },
        {
          "nkakouros-original/numbers.nvim",
          event = "InsertEnter",
          config = function()
            require("numbers").setup({
              excluded_filetypes = {
                'TelescopePrompt',
                'TelescopeResults',
                'nerdtree',
                'unite',
              }
            })
          end,
        },
        {
          "kevinhwang91/nvim-hlslens",
          keys = { "/", "?", "q/", "q?", "*", "#", "g*", "g#", "n", "N" },
          config = function()
            require("hlslens").setup( { calm_down = true } )
          end,
        },
        {
          "ethanholz/nvim-lastplace",
          config = function()
            require("nvim-lastplace").setup( {
              lastplace_ignore_buftype = {"quickfix", "nofile", "help", "terminal", "lsp-installer", "lspinfo"},
              lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit","startify", "dashboard", "packer", "neogitstatus", "NvimTree", "neo-tree", "Trouble"},
              lastplace_open_folds = true
            } )
          end,
        },
        {
          "nvim-treesitter/nvim-treesitter-refactor",
          after = "nvim-treesitter",
        },
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
          after = "nvim-treesitter",
        },
        {
          "s1n7ax/nvim-window-picker",
          tag = 'v1.*',
          -- after = "neo-tree",
          config = function()
            require'window-picker'.setup()
          end,
        },
      }

      -- disable aerial lazy load
      default_plugins["stevearc/aerial.nvim"].opt = false
      default_plugins["stevearc/aerial.nvim"].setup = nil
      -- load lualine after aerial
      default_plugins["nvim-lualine/lualine.nvim"].after = "aerial.nvim"

      return vim.tbl_deep_extend("force", default_plugins, my_plugins)
    end,

    -- All other entries override the setup() call for default plugins
    aerial = {
      backends = { "treesitter", "lsp", "markdown" },
      min_width = 20,
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', "}", "}", { silent = true })
        vim.keymap.del("n", "}")
        vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<cr>", { buffer = bufnr, desc = "Jump backwards in Aerial" })
        vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<cr>", { buffer = bufnr, desc = "Jump forwards in Aerial" })
        -- Jump up the tree with '[[' or ']]'
        vim.keymap.set('n', "]]", "]]", { silent = true })
        vim.keymap.del("n", "]]")
        vim.keymap.set('n', "[[", "[[", { silent = true })
        vim.keymap.del("n", "[[")
        vim.keymap.set("n", "<leader>[", "<cmd>AerialPrevUp<cr>", { buffer = bufnr, desc = "Jump up and backwards in Aerial" })
        vim.keymap.set("n", "<leader>]", "<cmd>AerialNextUp<cr>", { buffer = bufnr, desc = "Jump up and forwards in Aerial" })
      end,
      -- placement_editor_edge = true,
      open_automatic = function(bufnr)
        -- Enforce a minimum line count
        return vim.api.nvim_buf_line_count(bufnr) > 26
          -- Enforce a minimum symbol count
          and require("aerial").num_symbols(bufnr) > 3
          -- -- A useful way to keep aerial closed when closed manually
          and not require("aerial").was_closed()
      end,
    },
    gitsigns = {
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn", },
      },
      word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
    },
    lualine = function(config)
      table.insert(config.sections.lualine_c, 1, "filename")
      -- add aerial to beginning of lualine_x section
      table.insert(config.sections.lualine_x, 1, "aerial")
      return config
    end,
    treesitter = {
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "cmake",
        -- "comment",
        "cpp",
        "cuda",
        "dockerfile",
        "dot",
        "fortran",
        "go",
        "html",
        "java",
        -- "javascript",
        "json",
        "json5",
        "jsonc",
        "julia",
        -- "latex",
        "lua", -- problematic on remote servers?
        "make",
        "markdown",
        "ninja",
        "perl",
        "python",
        "r",
        "regex",
        -- "rst",
        "ruby",
        -- "rust",
        "toml",
        "verilog",
        "vim",  -- problematic on remote servers?
        "yaml",
      },
      highlight = {
        use_languagetree = true,
      },
      context_commentstring = {
        config = {
          vim = '" %s',
        },
      },
      indent = {
        enable = true,
      },
      refactor = {
        highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~100.
        },
        -- highlight_current_scope = { enable = true },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer", -- "m" for method
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
    },
    whichkey = {
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- )))

  -- Add paths for including more VS Code style snippets in luasnip (((

  -- luasnip = {
  --   vscode_snippet_paths = {},
  -- },

  -- )))

  -- Modify which-key registration (((

  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          l = {
            w = {
              "<cmd>Telescope diagnostics<cr>",
              "Workspace Diagnostics",
            },
            j = {
              "<cmd>lua vim.diagnostic.goto_next()<CR>",
              "Next Diagnostic",
            },
            k = {
              "<cmd>lua vim.diagnostic.goto_prev()<cr>",
              "Prev Diagnostic",
            },
            l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
            q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
            y = {
              "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
              "Workspace Symbols",
            },
          },
          s = {
            a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
            -- b = { "nil", "Builtins" },
            b = { "<cmd>Telescope builtin<cr>", "Builtins" },
            B = { "<cmd>Telescope current_buffer_tags<cr>", "Tags in Current Buffer" },
            C = { "<cmd>Telescope colorscheme<cr>", "Pick colorscheme" },
            d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
            g = { "<cmd>Telescope grep_string<cr>", "Search String" },
            H = { "<cmd>Telescope highlights<cr>", "Highlight Group" },
            i = { "<cmd>Telescope symbols<cr>", "Icons (Unicode Emojis/Symbols)" },
            j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
            p = { "<cmd>Telescope projects<cr>", "Projects" },
            q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
            R = { "<cmd>Telescope resume<cr>", "Resume Last" },
            s = { "<cmd>Telescope treesitter<cr>", "Outline Symbols (from treesitter)" },
            t = { "<cmd>Telescope tags<cr>", "Tags in Project" },
            T = { "<cmd>Telescope tagstack<cr>", "Tagstack" },
            v = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
            y = { "<cmd>Telescope filetypes<cr>", "Choose filetype" },
          },
          w = { nil },
          q = { nil },
          h = { nil },
          g = {
            B = {
              "<cmd>Gitsigns stage_buffer<CR>",
              "Stage Buffer",
            },
            C = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commits" },
            f = { "<cmd>Telescope git_files<cr>", "Repo files" },
            g = { nil },
            H = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
            o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
            s = { "<cmd>Telescope git_status<cr>", "Git Status" },
            t = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
            U = {
              function()
                require("core.utils").toggle_term_cmd "gitui"
              end,
              "GitUI",
            },
            u = {
              "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
              "Undo Stage Hunk",
            },
          },
          t = {
            l = { nil },
            g = {
              function()
                require("core.utils").toggle_term_cmd "gitui"
              end,
              "GitUI",
            },
          },
        },
      },
    },
  },

  -- )))

  -- CMP Source Priorities (((

  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    experimental = {
      ghost_text = true,
      native_menu = true,
    },
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- )))

  -- Extend LSP configuration (((

  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server.name].setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- )))

  -- Diagnostics configuration (for vim.diagnostics.config({})) (((

  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  -- )))

  -- null-ls configuration (((

  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end,
    }
  end,

  -- )))

  -- This 'polish' function is run last (good place to configure mappings and vim options) (((
  polish = function()

    -- options/settings (((

    -- options (vimscript-based) (((

    vim.cmd([[
    set whichwrap+=<,>,[,],h,l

    " Linebreak settings (((

    " let &showbreak='→ '
    let &showbreak='↪ '
    " let &showbreak='… '
    set breakat=\ \ ;:,!? " which characters might cause a line break if 'linebreak' is on.
    set breakindentopt=shift:2,sbr

    " )))

    " formatoptions (((

    " set formatoptions-=cro " TODO: this doesn't seem to work
    set formatoptions-=t " Disable 'auto-wrap text using textwidth'
    set formatoptions+=n " When formatting text, recognize numbered lists. This actually uses the 'formatlistpat' option, thus any kind of list can be used. Helps to avoid joining distinct items as if they were a single paragraph.

    " )))

    " Wildignore and low-priority suffixes/filetype-extensions (((

    " Ignore the following type of files when tab completing. " There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
    set wildignore+=*.4ct,*.4tc,*.7z,*.a,*.acn,*.acr,*.alg,*.auxlock,*.backup,*.bcf,*.beam,*.bin,*.blg,*.bmp,*.brf,*.cb,*.cb2,*.class,*.cpt,*.cut,*.dats,*.db,*.dll,*.dmg,*.docx,*.dpth,*.DS_Store,*.dx64fsl,*.el,*.end,*.ent,*.eps,*.exe,*.fasl,*.fdb_latexmk,*.fff,*.fls,*.flv,*.fmt,*.fot,*.gaux,*.gem,*.gif,*.git,*.glg,*.glo,*.gls,*.glsdefs,*.glstex,*.gtex,*.hg,*.hst,*.idv,*.idx,*.ilg,*.img,*.ind,*.ini,*.ist,*.jpeg,*.JPG,*.la,*.lb,*.lg,*.listing,*.lnk,*.loa,*.load,*.loe,*.lof,*.lol,*.lot,*.lox,*.ltjruby,*.luac,*.lx64fsl,*.maf,*.manifest,*.mf,*.mkv,*.mlf,*.mlt,*.mo,*.mod,*.mp,*.mp4,*.mw,*.nav,*.nlg,*.nlo,*.nls,*.o,*.obj,*.orig,*.pax,*.pdf,*.pdfpc,*.pdfsync,*.png,*.pre,*.ps,*.psd,*.pyc,*.pyg,*.pyo,*.pytxcode,*.rar,*.rbc,*.rbo,*.run.xml,*.save,*.snm,*.so,*.soc,*.sout,*.spl,*.sqlite,*.sta,*.svg,*.svn,*.sw?,*.swp,*.sympy,*.synctex,*.synctex.gz,*.tar,*.tar.bz2,*.tar.gz,*.tar.xz,*.tdo,*.texpadtmp,*.tfm,*.thm,*.tiff,*.toc,*.trc,*.ttt,*.upa,*.upb,*.ver,*.vrb,*.wrt,*.xcp,*.xdv,*.xdy,*.xlsx,*.xmpi,*.xpm,*.xref,*.xyc,*.xz,*.zip,*/.bundle/*,*/.cls,*/.fdb*/,*/.git/*,*/.glo,*/.ist,*/.sass-cache/*,*/.svn/*,*/.toc,*/.vim$,*/__pycache__/*,*/builds/*,*/dist*/*,*/node_modules/*,*/target/*,*/tmp/*,*/vendor/cache/*,*/vendor/gems/*,*/venv/*,*\\tmp\\*,*~,./tags,._*,.git/,.git/*,.idea/,\~$,_site,bower_components/*,CVS,CVS/*,media/*,migrations,tags,types_*taghl,vendor/cache/**,vendor/rails/**,


    " This gives files lower priority, instead of outright ignoring them
    set suffixes+=*.info,*.aux,*.log,*/.log,*.dvi,*.bbl,*.out,*/.out,*.old,*.bak

    " )))

    " Custom 'Underline' command using user-defined function (((

    " https://vim.fandom.com/wiki/Underline_using_dashes_automatically
    function! s:Underline(chars) abort
      let chars = empty(a:chars) ? '-' : a:chars
      let nr_columns = virtcol('$') - 1
      let uline = repeat(chars, (nr_columns / len(chars)) + 1)
      put =strpart(uline, 0, nr_columns)
    endfunction
    command! -nargs=? Underline call s:Underline(<q-args>)

    " )))

    " Formatlistpat settings (((

    " A pattern that is used to recognize a list header.  This is used for the "n" flag in 'formatoptions'. The pattern must match exactly the text that will be the indent for the line below it.  You can use |/\ze| to mark the end of the match while still checking more characters.  There must be a character following the pattern, when it matches the whole line it is handled like there is no match. The default recognizes a number, followed by an optional punctuation character and white space.

    set formatlistpat=^\\s*                " Optional leading whitespace
    set formatlistpat+=[                   " Start character class
    set formatlistpat+=\\[({]\\?           " |  Optionally match opening punctuation
    set formatlistpat+=\\(                 " |  Start group
    set formatlistpat+=[0-9]\\+            " |  |  Numbers
    set formatlistpat+=\\\|                " |  |  or
    set formatlistpat+=[a-zA-Z]\\+         " |  |  Letters
    set formatlistpat+=\\)                 " |  End group
    set formatlistpat+=[\\]:.)}            " |  Closing punctuation
    set formatlistpat+=]                   " End character class
    set formatlistpat+=\\s\\+              " One or more spaces
    set formatlistpat+=\\\|                " or
    set formatlistpat+=^\\s*[-–+o*•]\\s\\+ " Bullet points

    " )))

    " Global g:tex_ settings (((

    " https://damrah.netlify.app/post/note-taking-with-latex-part-1/
    " let g:tex_no_error=1   " The <tex.vim> supports lexical error checking of various sorts.  Thus, although the error checking is ofttimes very useful, it can indicate errors where none actually are.  If this proves to be a problem for you, you may put in your vimrc the following statement: > let g:tex_no_error=1 and all error checking by <syntax/tex.vim> will be suppressed.
    let g:tex_comment_nospell= 1
    let g:tex_conceal='abdmgs'
    let g:tex_flavor = 'latex'
    let g:tex_fold_enabled=1
    let g:tex_isk='48-57,a-z,A-Z,192-255,:,_'

    " )))

    " Disable unnecessary internal plugins (((

    let g:did_install_default_menus = 1
    let g:did_install_syntax_menu   = 1
    " let g:did_indent_on             = 1    " raises an error: Vim(doautocmd):E216: No such group or event: filetypeindent FileType markdown
    let g:did_load_ftplugin         = 1
    let g:skip_loading_mswin        = 1
    let g:loaded_remote_plugins     = 1

    " I prefer filtering text with Unix tools
    let g:loaded_logiPat            = 1

    " let g:loaded_man                = 1
    " let g:loaded_matchit            = 1
    let g:loaded_matchparen         = 1

    " I don't use Vim servers
    let g:loaded_rrhelper           = 1

    let g:loaded_shada_plugin       = 1
    let g:loaded_spellfile_plugin   = 1
    " let g:loaded_tutor_mode_plugin  = 1

    let g:loaded_netrw              = 1
    let g:loaded_netrwFileHandlers  = 1
    let g:loaded_netrwSettings      = 1
    let g:loaded_netrwPlugin        = 1
    let g:netrw_nogx                = 1

    " )))

    " Folding-related global(g:) variables for various languages (((

    let g:markdown_folding        = 1
    let g:markdown_enable_folding = 1
    let g:tex_fold_enabled        = 1
    let g:vimsyn_folding          = 'af'
    let g:xml_syntax_folding      = 1
    let g:javaScript_fold         = 1
    let g:sh_fold_enabled         = 7
    let g:ruby_fold               = 1
    let g:perl_fold               = 1
    let g:perl_fold_blocks        = 1
    let g:r_syntax_folding        = 1
    let g:rust_fold               = 1
    let g:php_folding             = 1

    " )))

    " Diff-mode settings (((

    set diffopt+=vertical,foldcolumn:0,context:3,iwhiteall,hiddenoff
    " set diffopt+=internal,indent-heuristic,algorithm:histogram
    set diffopt+=indent-heuristic,algorithm:minimal

    " )))

    " Settings for 'listchars' which define extra list display characters (((

    set listchars=
    set listchars+=tab:▸\     " Tab characters, preserve width
    set listchars+=trail:·    " Trailing spaces
    set listchars+=extends:>  " Unwrapped text to screen right
    set listchars+=precedes:< " Unwrapped text to screen left
    set listchars+=nbsp:␣

    " )))

    " Title (GUI/terminal) settings (((

    set title
    set titleold="Terminal"

    " https://github.com/factorylabs/vimfiles/blob/ad1f9ffcd8c1e620a75a28822aaefc2097640b0d/home/.vimrc#L309
    " Set the title bar to something meaningful

    " set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
    " set titlestring=%f%(\ [%M]%)
    " set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

    set titlestring=
    set titlestring+=%f\                " file name
    set titlestring+=%h%m%r%w           " flags
    set titlestring+=\ -\ %{v:progname} " program name

    " )))

    " Settings for grepprg and grepformat (((

    if executable('rg')
      set grepprg=rg\ -H\ --no-heading\ --vimgrep
      set grepformat^=%f:%l:%c:%m
    endif

    " )))

    " Other non-conditional settings/declarations (set xxxxxxx) (((

    " set path+=**    " Search current directory's whole tree
    set cpoptions-=a  " Stop the :read command from annoyingly setting the alternative buffer
    set fileformats=unix,dos,mac " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer:
    set isfname-==
    set isfname-={,}
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " Probably overridden by status-line plugins
    set virtualedit+=block " Allow movement beyond buffer text only in visual block mode

    " )))

    " Mappings (((

    " https://github.com/neovim/neovim/issues/9953
    " if &wildoptions == 'pum'
    "     cnoremap <expr> <up>   pumvisible() ? "<C-p>" : "\<up>"
    "     cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\<down>"
    " endif
    "
    " cnoremap <c-n> <down>
    " cnoremap <c-p> <up>

    " Replace :w with :up
    cnoreabbrev <expr> w getcmdtype() == ":" && getcmdline() == 'w' ? 'up' : 'w'

    " https://stackoverflow.com/questions/3131393/remapping-help-in-vim-to-open-in-a-new-tab
    cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
    cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

    " nnoremaps (((

    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> <Down> (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
    noremap <silent> <expr> <Up> (v:count == 0 ? 'gk' : 'k')

    " https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/?sort=old
    " nnoremap g. /\V\C<C-r>"<CR>cgn<C-a><Esc>
    nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>


    " replace the word under cursor
    nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

    noremap <c-w>" <c-w>t<c-w>K     " change vertical to horizontal with -
    noremap <c-w>% <c-w>t<c-w>H    " change horizontal to vertical with %

    " )))

    " Make jump-selections work better in visual block mode (((

    xnoremap <expr>  G   'G' . virtcol('.') . "\|"
    xnoremap <expr>  }   '}' . virtcol('.') . "\|"
    xnoremap <expr>  {   '{' . virtcol('.') . "\|"

    " )))

    " Substitute word under cursor and dot repeat (((

    " https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
    " nnoremap <silent> \\C :let @/='\<'.expand('<cword>').'\>'<CR>cgn
    " xnoremap <silent> \\C "sy:let @/=@s<CR>cgn

    " )))

    " )))

    " Dictionary settings (((

    if has('unix')
      silent! set dictionary+=/usr/share/dict/words
      silent! set dictionary+=/usr/share/dict/american-english
      silent! set dictionary+=/usr/share/dict/british-english
      silent! set dictionary+=/usr/share/dict/cracklib-small
    endif

    " )))

    " Custom highlights (((

    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Nobody wants to commit merge conflict markers, so let’s highlight these so we can’t miss them: https://vimways.org/2018/vim-and-git/

    " )))

    " shortmess settings (((

    set shortmess+=I  " Don't give the intro message when starting Vim |:intro|.
    set shortmess+=c  " Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc.
    set shortmess-=x  " Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions

    " )))

    set tags=~/.cache/tags

    set foldexpr=nvim_treesitter#foldexpr()

    ]])

    -- )))

    -- options (lua-based) (((

    local set = vim.opt
    -- NOTE: only my preferred settings that are not set by AstroNvim are set here

    vim.g.mapleader = "\\"
    vim.g.python3_host_prog = "python3"
    -- vim.g.ale_disable_lsp = 1
    vim.g.indent_blankline_show_first_indent_level = false

    -- Backup-related settings (((

    set.backupdir:remove { "." }
    set.backupext = "nvimbackup"

    -- )))

    -- fillchar settings (((

    -- Set `fg` to the color you want your window separators to have
    -- https://www.reddit.com/r/neovim/comments/tpmnlv/psa_make_your_window_separator_highlight_bold_of/
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'black', bold = true })

    -- https://vi.stackexchange.com/questions/21872/change-fold-sign-character
    set.fillchars = {
      foldclose = '▸',
      foldopen = '▾',
      foldsep = '│',
      horiz = '━',
      -- horiz = '━',
      horizdown = '┳',
      -- horizdown = '┳',
      horizup   = '┻',
      -- horizup = '┻',
      vert = '┃',
      -- vert = '┃',
      verthoriz = '╋',
      -- verthoriz = '╋',
      vertleft  = '┫',
      -- vertleft  = '┫',
      vertright = '┣',
      -- vertright = '┣',
    }

    -- )))

    -- Commented-out settings (((

    -- set.backup = false,       -- creates a backup file

    -- )))

    -- Case-sensitivity options (((

    set.infercase = true -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.

    -- )))

    -- Tab settings: shiftwidth, tabstop, softtabstop (((

    set.softtabstop = 2 -- how many spaces to insert with tab key

    -- )))

    -- Indent settings (((

    -- Basic indent settings (((

    set.smartindent = false
    set.autoindent = true
    set.copyindent = true -- Copy the previous indentation on autoindenting
    set.preserveindent = true
    -- set.smartindent = true  -- make indenting smarter again

    -- )))

    -- Indent wrapped lines (((

    set.wrap = true
    set.linebreak = true -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
    set.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.

    -- )))

    -- )))

    -- Scroll-related settings (scrolljump, sidescroll) (((

    set.scrolloff = 2 -- Minimal number of screen lines to keep above and below the cursor
    set.sidescrolloff = 8 -- The minimal number of screen columns to keep to the left and to the right of the cursor
    -- set.scrolljump = 3  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
    -- set.sidescroll = 3  -- The minimal number of columns to scroll horizontally

    -- )))

    -- Fold settings (((

    set.foldlevel = 2 -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
    set.foldlevelstart = 2
    set.foldcolumn = "auto:5"
  -- set foldopen=all -- helps to avoid automatic closing of previously open folds when returning to a buffer

    -- )))

    -- Settings for showing matching parenthesis (((

    set.showmatch = true
    set.matchtime = 3 -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.

    -- )))

    -- All other lua-based options (((

    set.clipboard = ""
    set.confirm = true -- Give me a prompt instead of just rejecting risky :write, :saveas
    -- set.cursorlineopt = "number"
    set.guifont = "monospace:h17" -- the font used in graphical neovim applications
    set.history = 10000
    set.inccommand = "split"
    set.iskeyword:append { "-" }
    set.lazyredraw = true -- Don't redraw the screen during batch execution
    set.list = true
    -- set.numberwidth = 4 -- set number column width
    set.pumwidth = 35
    set.spelllang = "en_gb"
    set.report = 0 -- Threshold for reporting number of lines changed.
    -- set.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds). set to 300 by AstroNvim
    set.updatecount = 100 -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
    set.winaltkeys = "no"
    set.wildignorecase = true -- If supported, make wildmenu completions case-insensitive
    vim.wo.colorcolumn = ""

    -- )))

    -- )))

    -- )))

    -- autocommands (lua-based) (((

    vim.api.nvim_create_augroup("packer_conf", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- )))

    -- autocommands (vimscript-based) (((

    vim.cmd [[

    " _general_settings autogroup (((

    augroup _general_settings
      autocmd!

      " ft help autocommands (((

      autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>

      " Press Enter to follow a help tag
      autocmd FileType help nnoremap <buffer><CR> <c-]>

      " Press Backspace to go back to the location of the previous tag
      autocmd FileType help nnoremap <buffer><BS> <c-T>

      " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
      autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

      autocmd FileType help setlocal number relativenumber

      " )))

      " autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 400})
      autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=650 }

      " autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
      " autocmd BufWinEnter *.txt set iskeyword+=- iskeyword+=: iskeyword+=.

      autocmd BufWinEnter * set formatoptions-=cro

      " https://stackoverflow.com/questions/4687009/opening-help-in-a-full-window
      " autocmd FileType help :tabnew % | tabprevious | quit | tabnext
      autocmd FileType help set buflisted

      autocmd FileType qf set nobuflisted

      autocmd FileType asciidoc,changelog,context,gitcommit,mail,rtf,markdown,lsp_markdown,rst,tex,texinfo,text,txt setlocal spell
      autocmd FileType gitcommit setlocal wrap textwidth=80

    augroup end

    " )))

    augroup _auto_resize
      autocmd!
      autocmd VimResized * tabdo wincmd =
    augroup end

    " Autocommand to set ft to julia for files ending in .jl (((

    augroup _julia
      autocmd!
      autocmd BufRead,BufNewFile *.jl set filetype=julia
    augroup END

    " )))

    " Autocommand for file changed alert (((

    augroup FileChangedAlert
      " Helps if you have to use another editor on the same file https://vimhelp.org/vim_faq.txt.html
      autocmd!
      autocmd FileChangedShell *
      \ echohl WarningMsg |
      \ echo "File has been changed outside of vim." |
      \ echohl None
    augroup END

    " )))

    " Autocommand for disabling undofile in /tmp on non-windows systems (((

    if !has('win32') || !has('win64')
      augroup disableTempUndo
      autocmd!
      autocmd BufWritePre /tmp/* setlocal noundofile
      augroup END
    endif

    " )))

    " " Autocommand for remembering cursor position (((
    "
    " " :help restore-cursor
    " augroup vimrc-remember-cursor-position
    "   autocmd!
    "   autocmd BufRead * autocmd FileType <buffer> ++once
    "   \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
    " augroup END
    "
    " " )))

    " Autocommand to stop insert when focus is lost (((

    augroup FocusLostAucmd
      autocmd!
      autocmd FocusLost * stopinsert
    augroup END

    " )))

    " Autocommands for LaTeX filetype (((

    augroup LaTeXSettings
      autocmd!
      autocmd FileType tex setlocal foldcolumn=auto:7
      autocmd InsertEnter *.tex set conceallevel=0
      autocmd InsertLeave *.tex set conceallevel=2
    augroup END

    " )))

    ]]

    -- )))

    -- adding custom filetypes (lua-based config from nvim 0.7+) (((

    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

    -- )))

    -- keybindings (lua-based) (((

    -- Declare local variables for keymaps (options and shortened names) (((

    local opts_noremapsilent = { noremap = true, silent = true }
    local opts_noremapverbose = { noremap = true, silent = false }
    local opts_remapsilent = { noremap = false, silent = true }
    local term_opts = { noremap = true, silent = true }
    local keymapset = vim.keymap.set

    -- )))

    -- Disable some unnecessary/confusing default mappings (((

    keymapset({ "n", "i" }, "<f1>", "<Nop>", opts_noremapsilent)
    keymapset({ "n", "x" }, "s", "<Nop>", opts_remapsilent) -- Disable 's' as recommended by sandwich.vim help file

    -- )))

    -- Disable AstroNvim mappings that override important vim defaults (((

    vim.keymap.set('n', "}", "}", { silent = true })
    vim.keymap.del("n", "}")
    vim.keymap.set('n', "{", "{", { silent = true })
    vim.keymap.del("n", "{")
    vim.keymap.set('n', "<C-q>", "<Nop>", { silent = true })
    vim.keymap.del("n", "<C-q>")
    vim.keymap.set('n', "<C-s>", "<Nop>", { silent = true })
    vim.keymap.del("n", "<C-s>")
    vim.keymap.set('n', "<leader>h", "<Nop>", { silent = true })
    vim.keymap.set('n', "H", "H", { silent = true })
    vim.keymap.del("n", "H")
    vim.keymap.set('n', "L", "L", { silent = true })
    vim.keymap.del("n", "L")
    vim.keymap.set('x', "J", "J", { silent = true })
    vim.keymap.del("x", "J")
    vim.keymap.set('x', "K", "K", { silent = true })
    vim.keymap.del("x", "K")
    -- vim.keymap.set('x', "<A-j>", "<Nop>", { silent = true })
    -- vim.keymap.del("x", "<A-j>")
    -- vim.keymap.set('x', "<A-k>", "<Nop>", { silent = true })
    -- vim.keymap.del("x", "<A-k>")

    -- )))

    keymapset({ "n", "x" }, "&", ":&&<CR>", opts_noremapsilent) -- Remap normal/visual '&' to preserve substitution flags

    -- Normal mode keymaps -- (((

    -- keymapset("n", "<leader>e", ":Lexplore 20<cr>", opts_noremapsilent)
    keymapset("n", "<C-w>f", "<C-w>vgf", opts_noremapsilent) -- is a more generic mode remap required?
    keymapset("n", "J", "mzJ`zmz", opts_noremapsilent)
    keymapset("n", "'", "`", opts_noremapsilent)
    keymapset("n", "<C-]>", "g<C-]>", opts_noremapsilent) -- show options if tag has multiple matches

    -- Keymaps for navigating folds (((

    -- keymapset("n", "zf", "zMzvzz", opts_noremapsilent)
    -- keymapset("n", "zj", "zcjzOzz", opts_noremapsilent)
    -- keymapset("n", "zk", "zckzOzz", opts_noremapsilent)
    keymapset("n", "<Space>", "za", opts_noremapsilent)

    -- )))

    -- Resize with smart-splits and meta-key mapping (((

    local smart_splits_status_ok, smart_splits = pcall(require, "smart-splits")
    if smart_splits_status_ok then
      keymapset('n', '<A-h>', smart_splits.resize_left)
      keymapset('n', '<A-j>', smart_splits.resize_down)
      keymapset('n', '<A-k>', smart_splits.resize_up)
      keymapset('n', '<A-l>', smart_splits.resize_right)
    end

    -- )))

    -- )))

    -- Insert mode keymaps -- (((

    keymapset("i", "<c-c>", "<ESC>", opts_noremapsilent) -- CTRL-C doesn't trigger the InsertLeave autocmd. Map to <ESC> instead.

    -- )))

    -- Visual mode keymaps -- (((

    keymapset("v", "y", "myy`ymy", opts_noremapsilent)
    keymapset("v", "Y", "myY`ymy", opts_noremapsilent)

    -- )))

    -- Visual block mode keymaps  -- (((

    -- Stay in indent mode in visual-block mode (((

    keymapset("x", "<", "<gv", opts_noremapsilent)
    keymapset("x", ">", ">gv", opts_noremapsilent)

    -- )))

    -- )))

    -- Command-line mode keymaps -- (((

    keymapset("c", "<c-n>", "<down>", opts_noremapverbose)
    keymapset("c", "<c-p>", "<up>", opts_noremapverbose)

    -- )))

    -- https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/?sort=old
    -- nnoremap g. /\V\C<C-r>"<CR>cgn<C-a><Esc>
    -- vim.cmd[[nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>]]

    -- Plugin keymaps (((

    -- Gitsigns keymaps (((

    keymapset("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    keymapset("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
    keymapset("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    keymapset("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")

    -- )))

    -- )))

    -- )))

    end,
  }

  -- )))

return config
