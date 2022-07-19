-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2
-- NOTE: Only my preferred settings that are not set by AstroNvim are here
return function(defaults)
  defaults.g.loaded_netrwPlugin = nil
  defaults.g.mapleader = "\\" -- sets vim.g.mapleader

  return vim.tbl_deep_extend("force", defaults, {
    -- vim.opt settings (((

    opt = {
      -- Backup-related settings (((

      backupdir = vim.opt.backupdir - { "." },
      backupext = "nvimbackup",

      -- )))
      -- 'fillchar' settings (((

      -- https://vi.stackexchange.com/questions/21872/change-fold-sign-character
      fillchars = {
        -- fold = "",
        fold = " ",
        -- foldclose = "▸",
        -- foldclose = "",
        foldclose = "",
        -- foldopen = "▾",
        foldopen = "",
        foldsep = "│",
        horiz = "━",
        -- horiz = '━',
        horizdown = "┳",
        -- horizdown = '┳',
        horizup = "┻",
        -- horizup = '┻',
        stlnc = "»",
        vert = "┃",
        -- vert = '┃',
        verthoriz = "╋",
        -- verthoriz = '╋',
        vertleft = "┫",
        -- vertleft  = '┫',
        vertright = "┣",
        -- vertright = '┣',
      },

      -- )))
      -- Scroll-related settings (scrolljump, sidescroll) (((

      scrolloff = 2, -- Minimal number of screen lines to keep above and below the cursor
      shortmess = vim.opt.shortmess + { I = true, c = true, x = false }, -- " a) +I => Don't give the intro message when starting Vim |:intro|. b) +c => Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc. c) -x => Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions.
      sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the right of the cursor
      -- scrolljump = 3,  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
      -- sidescroll = 3,  -- The minimal number of columns to scroll horizontally

      -- )))
      -- Indent wrapped lines (((

      wrap = true,
      linebreak = true, -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
      breakindent = true, -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.

      -- )))
      -- Fold settings (((

      foldcolumn = "4",
      foldlevel = 2, -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
      foldlevelstart = 2,
      -- foldopen=all, -- helps to avoid automatic closing of previously open folds when returning to a buffer
      foldopen = vim.opt.foldopen + { "jump" },

      -- )))
      -- Settings for showing matching parenthesis (((

      showmatch = true,
      matchtime = 3, -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.

      -- )))
      -- All other lua-based options (((

      clipboard = "",
      conceallevel = 2,
      confirm = true, -- Give me a prompt instead of just rejecting risky :write, :saveas
      cursorlineopt = "number",
      foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
      foldmethod = "expr",
      guifont = "monospace:h17", -- the font used in graphical neovim applications
      history = 10000,
      -- inccommand = "split",
      infercase = true, -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.
      iskeyword = vim.opt.iskeyword + { "-" },
      lazyredraw = true, -- Don't redraw the screen during batch execution
      -- jumpoptions = "view",
      list = true,
      listchars = { tab = "→ ", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
      -- listchars = { tab = "▸", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
      pumwidth = 35,
      shiftround = true,
      showbreak = "↪ ",
      signcolumn = "yes:1",
      softtabstop = 2, -- how many spaces to insert with tab key
      -- spell = true,
      -- spelllang = "en_gb",
      spelloptions = vim.opt.spelloptions + { "camel" },
      report = 0, -- Threshold for reporting number of lines changed.
      synmaxcol = 300,
      -- tildeop = yes, -- when on: The tilde command "~" behaves like an operator
      timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds). AstroNvim sets this to 300.
      updatecount = 100, -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
      -- whichwrap = vim.opt.whichwrap + { "<", ">", "[", "]", "h", "l" },
      whichwrap = vim.opt.whichwrap + {
        ["<"] = true,
        [">"] = true,
        ["["] = true,
        ["]"] = true,
        ["h"] = true,
        ["l"] = true,
      },
      wildignorecase = true, -- If supported, make wildmenu completions case-insensitive
      winaltkeys = "no",
      winminheight = 0, -- Default is 1. The minimal height of a window, when it's not the current window.

      -- )))
      -- Commented-out settings (((

      -- numberwidth = 4, -- set number column width
      -- tagcase = "smart",

      -- )))
    }, -- )))

    -- 'vim.g.' settings (((

    g = {
      detectspelllang_langs = {
        aspell = {
          "en_GB",
          "en_US",
          "cs",
          "cy",
          "da",
          "de_DE",
          "el",
          "es",
          "fr",
          "gd",
          "hu",
          "id",
          "it",
          "ms",
          "nl",
          "pl",
          "pt",
          "ro",
          "ru",
          "sk",
          "sl",
          "sv",
        },
        hunspell = {
          "en_GB",
          "en_US",
          "cs_CS",
          "cy_CY",
          "da_DA",
          "de_DE",
          "el_GR",
          "gd_GD",
          "es_ES",
          "fr_FR",
          "hu_HU",
          "id_ID",
          "it_IT",
          "ms_MS",
          "nl_NL",
          "pl_PL",
          "pt_PT",
          "ro_RO",
          "ru_RU",
          "sk_SK",
          "sl_SL",
          "sv_SV",
        },
      },
      matchup_matchparen_offscreen = { method = "popup" },
      matchup_surround_enabled = true,
      matchup_matchparen_enabled = false,
      matchup_matchparen_deferred = true,
      matchup_override_vimtex = true,
      python3_host_prog = "python3",
      tex_conceal = "abdmgs",
      markdown_folding = 1,
      loaded_perl_provider = 0, -- To disable perl support
      loaded_node_provider = 0, -- To disable node support
      loaded_ruby_provider = 0, -- To disable Ruby support
      loaded_python_provider = 0,
      python_host_skip_check = 1,
      did_load_ftplugin = 1,
      ccls_close_on_jump = true,
      ccls_levels = 3,
    },

    -- )))
  })
end

-- g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }
-- set path+=$PWD/**
-- set path+=/usr/local/include
