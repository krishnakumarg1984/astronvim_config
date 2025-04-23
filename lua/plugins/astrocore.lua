-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- 'astrocore' provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: Highly recommended to set up the Lua Language Server (`:LspInstall lua_ls`)
-- as this provides autocomplete and documentation while editing

-- vim.print("hello from astrocore")

---@type LazySpec
return {
  "AstroNvim/astrocore", -- Core AstroNvim configuration engine
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    opts = require("astrocore").extend_tbl(opts, {
      rooter = {
        ignore = { servers = { "julials" } },
        autochdir = true,
      },
      -- mappings, autocmds, extra filetypes, vim options and global variables can be configured here
      options = {
        -- vim options can be configured here
        opt = { -- vim.opt.<key>
          backupdir = vim.opt.backupdir - { "." },
          backupext = "nvimbackup",
          breakindentopt = { "shift:2", "sbr", "list:-1" }, -- https://vi.stackexchange.com/questions/9635/what-is-the-best-practice-in-vim8-for-wrapping-with-indentation-aka-breakindent
          clipboard = "",
          conceallevel = 1, -- enable conceal
          cpoptions = vim.opt.cpoptions - { "a" }, -- Stop :read from annoyingly setting alternative buffer
          fileformats = vim.opt.fileformats + { "mac" }, -- end-of-line (<EOL>) formats to be tried when starting to edit a new buffer and when reading a file into an existing buffer
          fillchars = {
            -- fold = " ",
            -- fold = "",
            -- foldclose = "▸",
            -- foldclose = "",
            -- foldclose = "",
            -- foldopen = "▾",
            -- foldopen = "",
            -- foldsep = "│",
            -- horiz = "━",
            -- horiz = '━',
            -- horizdown = "┳",
            -- horizdown = '┳',
            -- horizup = "┻",
            -- horizup = '┻',
            -- stlnc = "»",
            -- vert = "┃",
            -- vert = '┃',
            -- verthoriz = "╋",
            -- verthoriz = '╋',
            -- vertleft = "┫",
            -- vertleft = '┫',
            -- vertright = "┣",
            -- vertright = '┣',
          }, -- https://vi.stackexchange.com/questions/21872/change-fold-sign-character
          inccommand = "split",
          isfname = vim.opt.isfname - { ",", "=" }, -- When using commands like Ctrl-x Ctrl-f for filename completion, do not read equal signs as part of file names, a common nuisance when working with shell scripts
          iskeyword = vim.opt.iskeyword + { "-" },
          list = true,
          listchars = { tab = "→ ", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }, -- "│→" for tab?
          showbreak = "↪ ",
          showmatch = true,
          showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
          signcolumn = "yes:1",
          splitkeep = "screen",
          suffixes = vim.opt.suffixes + {
            "*.aux",
            "*.bbl",
            "*.dvi",
            "*.log",
            "*.nvimbackup",
            "*.old",
            "*.out",
            "*/.log",
            "*/.out",
          }, -- This gives files lower priority, instead of outright ignoring them
          tags = { "$HOME/.cache/nvim/tags" },
          whichwrap = vim.opt.whichwrap + {
            ["<"] = true,
            [">"] = true,
            ["["] = true,
            ["]"] = true,
            ["h"] = true,
            ["l"] = true,
          },
          wildignore = vim.opt.wildignore + { -- Ignore the following type of files when tab completing. There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
            "*.4ct",
            "*.4tc",
            "*.7z",
            "*.a",
            "*.acn",
            "*.acr",
            "*.alg",
            "*.auxlock",
            "*.backup",
            "*.bcf",
            "*.beam",
            "*.bin",
            "*.blg",
            "*.bmp",
            "*.brf",
            "*.cb",
            "*.cb2",
            "*.class",
            "*.cpt",
            "*.cut",
            "*.dats",
            "*.db",
            "*.dll",
            "*.dmg",
            "*.docx",
            "*.dpth",
            "*.DS_Store",
            "*.dx64fsl",
            "*.el",
            "*.end",
            "*.ent",
            "*.eps",
            "*.exe",
            "*.fasl",
            "*.fdb_latexmk",
            "*.fff",
            "*.fls",
            "*.flv",
            "*.fmt",
            "*.fot",
            "*.gaux",
            "*.gem",
            "*.gif",
            "*.git",
            "*.glg",
            "*.glo",
            "*.gls",
            "*.glsdefs",
            "*.glstex",
            "*.gtex",
            "*.hg",
            "*.hst",
            "*.idv",
            "*.idx",
            "*.ilg",
            "*.img",
            "*.ind",
            "*.ipynb",
            "*.ist",
            "*.jpeg",
            "*.JPG",
            "*.la",
            "*.lb",
            "*.lg",
            "*.listing",
            "*.lnk",
            "*.loa",
            "*.load",
            "*.loe",
            "*.lof",
            "*.lol",
            "*.lot",
            "*.lox",
            "*.ltjruby",
            "*.luac",
            "*.lx64fsl",
            "*.maf",
            "*.manifest",
            "*.mf",
            "*.mkv",
            "*.mlf",
            "*.mlt",
            "*.mo",
            "*.mod",
            "*.mp",
            "*.mp4",
            "*.mw",
            "*.nav",
            "*.nlg",
            "*.nlo",
            "*.nls",
            "*.o",
            "*.obj",
            "*.orig",
            "*.pax",
            "*.pdf",
            "*.pdfpc",
            "*.pdfsync",
            "*.png",
            "*.pre",
            "*.ps",
            "*.psd",
            "*.pyc",
            "*.pyg",
            "*.pyo",
            "*.pytxcode",
            "*.rar",
            "*.rbc",
            "*.rbo",
            "*.run.xml",
            "*.save",
            "*.snm",
            "*.so",
            "*.soc",
            "*.sout",
            "*.spl",
            "*.sqlite",
            "*.sta",
            "*.svg",
            "*.svn",
            "*.sw?",
            "*.swp",
            "*.sympy",
            "*.synctex",
            "*.synctex.gz",
            "*.tar",
            "*.tar.bz2",
            "*.tar.gz",
            "*.tar.xz",
            "*.tdo",
            "*.texpadtmp",
            "*.tfm",
            "*.thm",
            "*.tiff",
            "*.toc",
            "*.trc",
            "*.ttt",
            "*.upa",
            "*.upb",
            "*.ver",
            "*.vrb",
            "*.wrt",
            "*.xcp",
            "*.xdv",
            "*.xdy",
            "*.xlsx",
            "*.xmpi",
            "*.xpm",
            "*.xref",
            "*.xyc",
            "*.xz",
            "*.zip",
            "*/.bundle/*",
            "*/.cls",
            "*/.fdb*/",
            "*/.git/*",
            "*/.glo",
            "*/.ist",
            "*/.sass-cache/*",
            "*/.svn/*",
            "*/.toc",
            "*/.vim$",
            "*/__pycache__/*",
            "*/build/*",
            "*/builds/*",
            "*/dist*/*",
            "*/node_modules/*",
            "*/target/*",
            "*/tmp/*",
            "*/vendor/cache/*",
            "*/vendor/gems/*",
            "*/venv/*",
            "*\\tmp\\*",
            "*~",
            "./tags",
            "._*",
            ".git/",
            ".git/*",
            ".idea/",
            "_site",
            "bower_components/*",
            "CVS",
            "CVS/*",
            "media/*",
            "migrations",
            "tags",
            "types_*taghl",
            "vendor/cache/**",
            "vendor/rails/**",
            "~$",
          },
          wildignorecase = true, -- If supported, make wildmenu completions case-insensitive
          winaltkeys = "no",
          winminheight = 0, -- Default is 1. The minimal height of a window, when it's not the current window.
          wrap = true, -- soft wrap lines
          -- breakat = " \t;:,!?", -- which characters might cause a line break if 'linebreak' is on.
          -- cmdheight = 1,
          -- complete = vim.opt.complete + { "i" },
          -- cursorlineopt = "number",
          -- exrc = true,
          -- foldcolumn = "4",
          -- foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
          -- foldlevel = 2, -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
          -- foldlevelstart = 2,
          -- foldopen = vim.opt.foldopen + { "jump" },
          -- foldopen=all, -- helps to avoid automatic closing of previously open folds when returning to a buffer
          -- formatoptions = vim.opt.formatoptions - { "o" },
          -- guifont = "monospace:h17", -- the font used in graphical neovim applications
          -- history = 10000,
          -- inccommand = "split",
          -- jumpoptions = "view",
          -- lazyredraw = true, -- Don't redraw the screen during batch execution
          -- listchars = { tab = "▸", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
          -- matchtime = 3, -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.
          -- number = true, -- sets vim.opt.number
          -- path+=$PWD/**
          -- path+=**    " Search current directory's whole tree
          -- path+=/usr/local/include
          -- pumwidth = 35,
          -- report = 0, -- Threshold for reporting number of lines changed.
          -- rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) -- Probably overridden by status-line plugins
          -- scrolljump = 3,  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
          -- scrolloff = 2, -- Minimal number of screen lines to keep above and below the cursor
          -- shiftround = true,
          -- shiftwidth = 2,
          -- shortmess = vim.opt.shortmess + { I = true, c = true, x = false }, -- " a) +I => Don't give the intro message when starting Vim |:intro|. b) +c => Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc. c) -x => Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions.
          -- showtabline = 0, -- don't show tabline
          -- sidescroll = 3,  -- The minimal number of columns to scroll horizontally
          -- sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the right of the cursor
          -- softtabstop = 2, -- how many spaces to insert with tab key
          -- spell = true,
          -- spellfile = vim.fn.expand "~/.config/nvim/spell/en.utf-8.add",
          -- spelllang = "en_gb",
          -- spelloptions = vim.opt.spelloptions + { "camel" },
          -- synmaxcol = 300,
          -- tagcase = "smart",
          -- thesaurus = vim.fn.expand "~/.config/nvim/spell/mthesaur.txt",
          -- tildeop = yes, -- when on: The tilde command "~" behaves like an operator
          -- updatecount = 100, -- After typing these no. of characters, the swapfile will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
        },
        -- vim global variables can be configured here
        g = { -- vim.g.<key>
          -- configure global vim variables (vim.g)
          -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`

          -- This can be found in the `lua/lazy_setup.lua` file
          -- did_install_default_menus = 1, -- useful in guis
          -- did_install_syntax_menu = 1, -- useful in guis
          -- javaScript_fold = 1, -- is this actually useful?
          -- loaded_python3_provider = 0,
          -- loaded_ruby_provider = 0, -- To disable Ruby support
          -- netrw_nogx = 1,
          -- python3_host_prog = "python3",
          -- python_host_skip_check = 1,
          -- rust_fold = 1,
          -- tex_comment_nospell = 1, -- spell checking be disabled in comments in LaTeX files

          -- tex_conceal = "abdmgs", --  a = accents/ligatures b = bold and italic d = delimiters m = math symbols g = Greek s = superscripts/subscripts
          -- tex_flavor = "latex", -- vimtex already sets this up
          -- tex_fold_enabled = 1, -- will only work if foldmethod=syntax
          -- tex_isk = "48-57,a-z,A-Z,192-255,:,_", -- Normally, LaTeX keywords support 0-9, a-z, A-z, and 192-255 only.
          -- tex_nospell = 1, -- don't want spell checking anywhere in LaTeX document
          -- tex_stylish = 1, -- One may use "\makeatletter" in *.tex files, thereby making the use of "@" in commands available.  However, since the *.tex file doesn't have one of the following suffices: sty cls clo dtx ltx, the syntax highlighting will flag such use of @ as an error. Putting "let g:tex_stylish=1" into your vimrc will make <syntax/tex.vim> always accept such use of @.
          -- tex_verbspell = 0, -- Often verbatim regions in a LaTeX doc are used for things like source code; seldom does one want source code spell-checked.
          -- vimsyn_folding = "af",
        },
      },
      autocmds = {
        -- list of auto commands to set
        -- first key is the `augroup` (:h augroup)
        auto_spell = {
          {
            event = { "FileType" },
            desc = "Enable wrap and spell for text like documents",
            pattern = {
              "asciidoc",
              "changelog",
              "context",
              "gitcommit",
              "help",
              "lsp_markdown",
              "mail",
              "markdown",
              "NeogitCommit",
              "NeogitCommitMessage",
              "plaintex",
              "rst",
              "rtf",
              "texinfo",
              "text",
              "txt",
            },
            callback = function()
              -- vim.opt_local.wrap = true
              vim.opt_local.spell = true
            end,
          },
        },
        autohide_tabline = {
          {
            event = "User",
            desc = "Auto hide tabline",
            pattern = "AstroBufsUpdated",
            callback = function()
              local new_showtabline = #vim.t.bufs > 1 and 2 or 1
              if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
            end,
          },
        },
        filechangedalert = {
          {
            event = { "FileChangedShellPost" },
            pattern = "*",
            command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
            desc = "Warn user about file changed on disk outside of neovim",
          },
        },
        highlightyank = {
          {
            event = { "TextYankPost" },
            pattern = "*",
            callback = function() vim.highlight.on_yank { higroup = "IncSearch", timeout = 650 } end,
            desc = "Highlight yanked text",
          },
        },
        nexthelptag = {
          {
            event = { "FileType" },
            pattern = { "help", "qf", "vim", "vimdoc" },
            callback = function()
              vim.keymap.set("n", "<Leader>Tn", [[/|.\zs\S\{-}|/<cr>zz]], { buffer = true, noremap = true })
              vim.opt_local.list = false
              vim.opt_local.conceallevel = 3
              -- vm.wo.list = false
              -- vim.bo.list = false
            end,
            desc = "Next help tag",
          },
        },
        nvimformatoptions = {
          {
            -- events to trigger
            event = { "FileType" },
            -- pattern = "*",
            -- the rest of the autocmd options (:h nvim_create_autocmd)
            desc = "Custom formatoptions",
            callback = function()
              -- vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
              vim.opt.formatoptions = vim.opt.formatoptions
                - "a" -- Dont format pasted code
                - "o" -- O and o don't continue comments
                - "r" -- Return does not continue comments
                - "t" -- Delegate to linter programs or LSPs. Disable 'auto-wrap text using textwidth'
                -- + "c" -- comments respect textwidth
                -- + "q" -- Allow formatting comments w/ gq
                + "n" -- Recognize numbered lists.
                -- This actually uses the 'formatlistpat' option, thus any kind of list can be used. Helps to avoid joining distinct items as if they were a single paragraph.
                -- + "j" -- Auto-remove comments if possible.
                + "2" -- Indent according to 2nd line
            end,
          },
        },
        -- autoreadexternalchanges = {
        --   {
        --     event = { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" },
        --     pattern = "*",
        --     command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
        --     desc = "Trigger autoread when file changes on disk",
        --   },
        -- },
        -- conceallevelformarkdownfiles = {
        --   event = { "FileType" },
        --   pattern = {
        --     "lsp_markdown",
        --     "markdown",
        --     "markdown_inline",
        --   },
        --   callback = function() vim.opt_local.conceallevel = 3 end,
        --   desc = "Set conceallevel to 3 for markdown files",
        -- },
        -- winfocuslost = {
        --   {
        --     -- https://www.reddit.com/r/neovim/comments/159bib0/comment/jtf40i4/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
        --     -- Save all buffers when focus lost, ignoring warnings, and return to normal mode.
        --     event = { "FocusLost" },
        --     callback = function()
        --       vim.cmd.stopinsert()
        --       vim.cmd [[
        --         bufdo if expand('%')=='' | setlocal buftype=nofile | endif
        --         bufdo if exists(":Format") | execute ":Format" | endif | up
        --         ]]
        --       -- vim.cmd.wall { mods = { silent = true } }
        --     end,
        --     desc = "Stop insert mode and save all named buffers when focus is lost",
        --   },
        -- },
      },
      -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
      diagnostics = {
        underline = false,
        update_in_insert = false,
        -- virtual_lines = false,
        virtual_lines = { current_line = true, severity = { min = vim.diagnostic.severity.WARN } },
        virtual_text = false,
        -- virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
      },
      -- Configure core features of AstroNvim
      features = {
        diagnostics = { virtual_lines = false },
        -- large_buf = { size = 1024 * 256, lines = 10000 }, -- global limits for disabling features like treesitter
        -- autopairs = true, -- enable autopairs at start
        -- cmp = true, -- enable completion at start
        -- diagnostics_mode = 3, -- diag mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
        -- highlighturl = true, -- highlight URLs at start
        -- notifications = true, -- enable notifications at start
      },
      -- passed to `vim.filetype.add`
      filetypes = {
        -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/filetype.lua
        -- see `:h vim.filetype.add` for usage
        extension = {
          -- make = "make",
          -- yaml = yaml_ft,
          -- yml = yaml_ft,
          ["nf.test"] = "nextflow",
          j2 = "jinja",
          cl = "opencl",
          dvc = "yaml",
          frag = "glsl",
          fs = "glsl",
          geom = "glsl",
          gs = "glsl",
          jinja = "jinja",
          jinja2 = "jinja",
          jl = "julia",
          luaold = "lua",
          luatodo = "lua",
          mdx = "markdown.mdx",
          nf = "nextflow",
          pd_lua = "lua",
          pd_luax = "lua",
          qmd = "markdown",
          vert = "glsl",
          vs = "glsl",
        },
        filename = {
          [".codespellrc"] = "confini",
          [".dace.conf"] = "yaml",
          [".envrc"] = "sh",
          ["/etc/environment"] = "confini",
          ["/etc/mkinitcpio.conf"] = "confini",
          ["compose.yml"] = "yaml.docker-compose",
          ["compose.yaml"] = "yaml.docker-compose",
          ["devcontainer.json"] = "jsonc",
          ["docker-compose.yml"] = "yaml.docker-compose",
          ["docker-compose.yaml"] = "yaml.docker-compose",
          ["dvc.lock"] = "yaml",
          ["Dvcfile"] = "yaml",
          ["launch.json"] = "jsonc",
          ["meta-data"] = "yaml",
          ["spack.lock"] = "json",
          ["tasks.json"] = "jsonc",
          ["terraform.tfstate"] = "json",
          ["terraform.tfstate.backup"] = "json",
          ["user-data"] = "yaml",
          ["vendor-data"] = "yaml",
          ["zuliprc"] = "confini",
        },
        pattern = {
          ["%.env%.[%w_.-]+"] = "sh",
          [".*%.pkr.*%.hcl"] = "hcl.packer",
          [".*/kitty/.+%.conf"] = "bash",
          ["/tmp/neomutt.*"] = "markdown",
          -- [vim.env.XDG_CONFIG_HOME .. "/udev/rules.d/.*%.rules"] = "udevrules",
        },
      },
      mappings = { -- NOTE: keycodes follow the casing in vimdocs. For example, `<Leader>` must be capitalized
        --[[ c = {
          ["<C-n>"] = { "<Down>" },
          ["<C-p>"] = { "<Up>" },
        }, ]]
        i = {
          ["<C-C>"] = { "<ESC>" }, -- ctrl-c does not trigger the InsertLeave event autocmd. Map to <ESC>.
          ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
        },
        n = { -- tables with just a `desc` key will be registered with which-key. this is useful for naming menus
          -- disable certain remaps provided in base AstroNvim
          ["<C-Q>"] = false,
          ["<C-S>"] = false,
          ["<Leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
          ["<Leader>e"] = { false, desc = " Explorer" },
          ["<Leader>n"] = { false, desc = "" },
          ["<Leader>o"] = { false, desc = " Overseer" },
          ["<Leader>q"] = false,
          ["<Leader>w"] = false,
          ["\\"] = false,
          ["|"] = false,
          -- ["<leader>gh"] = false, -- originally reset_hunk
          -- ["<leader>gs"] = false, -- originally stage_hunk
          -- ["<Leader>lS"] = false, -- Symbols outline
          -- ["}"] = false,
          -- ['"'] = false,

          -- normal mode keymaps for built-in neovim functionality/features
          ["'"] = { "`" },
          ["<C-]>"] = { "g<C-]>" }, -- show options if tag has multiple candidates
          ["<C-w>%"] = { "<C-w>t<C-w>H", desc = "Change split to vertical" }, -- change a horizontal split to vertical
          ['<C-w>"'] = { "<C-w>t<C-w>K", desc = "Change split to horizontal" }, -- change a vertical split to horizontal
          ["<C-w>f"] = { "<C-w>vgf", desc = "Open in vertical split" }, -- is a more generic mode remap
          ["<C-w>z"] = { "<C-w>|<C-w>_", desc = "Maximize screen" }, -- zoom full-screen by maximising the screen height and width
          ["<Leader>*"] = { ":%s/<<c-r><c-w>>//g<left><left>", desc = "Replace cursor word" },
          ["<S-j>"] = { "mzJ`z" },
          ["<Space>"] = { "za" },
          -- ["<Leader>D"] = { "<cmd>window diffthis<CR>", desc = "Diff buffers" },
          -- ["<S-j>"] = { "mzJ`zmz" },
          -- ["N"] = { "Nzzzv" },
          -- ["n"] = { "nzzzv" },

          -- 'stevearc/aerial.nvim' mappings for normal mode
          -- ["<Leader>A"] = { desc = " Symbol tree" },
          -- ["<Leader>AA"] = { "<cmd>AerialToggle<cr>", desc = "Toggle outline (focus)" },
          -- ["<Leader>Ac"] = { "<cmd>AerialClose<cr> | let g:aerial_open_automatic = 0<cr>", desc = "Close outline" },
          -- ["<Leader>An"] = { "<cmd>AerialNext<cr>", desc = "Next symbol" },
          -- ["<Leader>Ao"] = { "<cmd>AerialOpen!<cr> | let g:aerial_open_automatic = 1<cr>", desc = "Open outline" },
          -- ["<Leader>Ap"] = { "<cmd>AerialPrev<cr>", desc = "Prev symbol" },

          -- -- 'nvim-neo-tree/neo-tree.nvim' keymaps for normal mode
          ["<Leader>ee"] = { "<cmd>Neotree action=show toggle=true<CR>", desc = "Toggle explorer" },
          -- ["<Leader>ef"] = { "<cmd>Neotree action=show focus<CR>", desc = "Focus explorer" },
          ["<Leader>ef"] = {
            function()
              if vim.bo.filetype == "neo-tree" then
                vim.cmd.wincmd "p"
              else
                vim.cmd.Neotree "focus"
              end
            end,
            desc = "Toggle Explorer Focus",
          },

          -- 'stevearc/overseer.nvim' keymaps (partial list) for normal mode
          -- ["<Leader>o"] = { "<cmd>Neotree action=show toggle=true<CR>", desc = "Toggle explorer" },

          -- 'akinsho/toggleterm.nvim' keymaps for normal mode
          ["<C-`>"] = {
            "<cmd>ToggleTerm dir=git_dir direction=horizontal size=9<cr>",
            desc = "Toggle terminal (horizontal)",
          },
          ["<C-'>"] = {
            "<cmd>ToggleTerm dir=git_dir direction=horizontal size=9<cr>",
            desc = "Toggle terminal (horizontal)",
          },
          -- ["<Leader>g<s-u>"] = { function() astro.toggle_term_cmd "gitui" end, desc = "GitUI" },
          -- ["<Leader>tu"] = { function() astro.toggle_term_cmd "lua" end, desc = "ToggleTerm Lua" },
          -- ["<M-t>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal (float)" },
          -- ["<M-'>"] = { "<cmd>ToggleTerm direction=horizontal size=9<cr>", desc = "Toggle terminal (horizontal)" },
        },
        --[[ o = {
          -- line text-objects
          ["iL"] = { ":<C-u>normal! $v^<CR>", desc = "Inside line text object" },
          ["aL"] = { ":<C-u>normal! $v0<CR>", desc = "Around line text object" },
        }, ]]
        t = {
          -- ["<M-m>"] = {
          --   "<cmd>tab split<cr>",
          --   desc = "Maximize terminal in a new tab",
          -- },
          ["<C-`>"] = {
            "<cmd>ToggleTerm dir=git_dir direction=horizontal size=9<cr>",
            desc = "Toggle terminal (horizontal)",
          },
          ["<C-'>"] = {
            "<cmd>TermNew<cr>",
            desc = "New split terminal",
          },
          ["<C-h>"] = false,
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<C-l>"] = false,
          ["<Esc>"] = { "<C-\\><C-n>", silent = true, desc = "Terminal normal mode" },
          -- ["<C-BS>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
          -- ["<Esc>"] = false,
          -- ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
          -- ["<M-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          -- ["<M-'>"] = { "<cmd>ToggleTerm direction=horizontal size=9<cr>", desc = "Toggle terminal (horizontal)" },
        },
        -- v = {
        --   -- ["*"] = { "y/\\V<C-R>=escape(@\",'/')<CR><CR>" },
        --   -- ["cg*"] = { "\"ay/\\V<C-R>=escape(@a,'/')<CR><CR>N\"_cgn" },
        --   -- https://www.reddit.com/r/neovim/comments/ttwzge/magic_replace_selected_text_mapping_with_repeat/
        --   ["y"] = { "myy`ymy" },
        --   ["Y"] = { "myY`ymy" },
        -- },
        x = {
          ["<C-S>"] = false,
          ["<"] = { "<gv" }, -- Stay in indent mode in visual-block mode
          [">"] = { ">gv" }, -- Stay in indent mode in visual-block mode
        },
      },
      signs = {
        BqfSign = { text = " " .. require("astroui").get_icon "Selected", texthl = "BqfSign" },
      },
    } --[[@as AstroCoreOpts]]) --[[@as AstroCoreOpts]]

    local maps = opts.mappings
    ---@cast maps -nil

    -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    maps.n.n = { "'Nn'[v:searchforward].'zv'", expr = true, desc = "Next Search Result" }
    maps.x.n = { "'Nn'[v:searchforward]", expr = true, desc = "Next Search Result" }
    maps.o.n = { "'Nn'[v:searchforward]", expr = true, desc = "Next Search Result" }
    maps.n.N = { "'nN'[v:searchforward].'zv'", expr = true, desc = "Prev Search Result" }
    maps.x.N = { "'nN'[v:searchforward]", expr = true, desc = "Prev Search Result" }
    maps.o.N = { "'nN'[v:searchforward]", expr = true, desc = "Prev Search Result" }

    -- add line text object
    for lhs, rhs in pairs {
      il = { ":<C-u>normal! $v^<CR>", desc = "inside line" },
      al = { ":<C-u>normal! V<CR>", desc = "around line" },
    } do
      maps.o[lhs] = rhs
      maps.x[lhs] = rhs
    end

    -- add missing in between and around two character pairs
    for _, char in ipairs { "_", "-", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
      for lhs, rhs in pairs {
        ["i" .. char] = { (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char), desc = "inside " .. char },
        ["a" .. char] = { (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char), desc = "around " .. char },
      } do
        maps.o[lhs] = rhs
        maps.x[lhs] = rhs
      end
    end

    return opts
  end,
}
