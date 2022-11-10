-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2
-- NOTE: Only my preferred settings that are not set by AstroNvim are here

return function(defaults)
  defaults.g.loaded_netrwPlugin = nil
  defaults.g.mapleader = "\\" -- sets vim.g.mapleader

  return vim.tbl_deep_extend("force", defaults, {
    -- vim.opt settings (((
    -- set vim options here (vim.<first_key>.<second_key> = value)

    opt = {
      backupdir = vim.opt.backupdir - { "." },
      backupext = "nvimbackup",
      breakindent = true, -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
      breakindentopt = { "shift:2", "sbr", "list:-1" }, -- https://vi.stackexchange.com/questions/9635/what-is-the-best-practice-in-vim8-for-wrapping-with-indentation-aka-breakindent
      clipboard = "",
      cmdheight = 1, -- until the cmdheight=0 bugs are squashed
      complete = vim.opt.complete + { "i" },
      conceallevel = 0,
      confirm = true, -- Give me a prompt instead of just rejecting risky :write, :saveas
      cursorlineopt = "number",
      fillchars = { -- (((
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
      }, -- https://vi.stackexchange.com/questions/21872/change-fold-sign-character -- )))
      -- foldcolumn = "4",
      foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
      foldlevel = 2, -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
      foldlevelstart = 2,
      foldmethod = "expr",
      foldopen = vim.opt.foldopen + { "jump" },
      history = 10000,
      infercase = true, -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.
      isfname = vim.opt.isfname - { "," },
      iskeyword = vim.opt.iskeyword + { "-" },
      lazyredraw = true, -- Don't redraw the screen during batch execution
      linebreak = true, -- Wrap lines at convenient point (only affects the on-screen display, not actual content in file) -- Break lines at word boundaries
      list = true,
      listchars = { tab = "→ ", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
      matchtime = 3, -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.
      pumwidth = 35,
      -- relativenumber = false,
      report = 0, -- Threshold for reporting number of lines changed.
      rtp = vim.opt.rtp + { "$HOME/.config/astronvim/after" },
      scrolloff = 2, -- Minimal number of screen lines to keep above and below the cursor
      shiftround = true,
      shortmess = vim.opt.shortmess + { I = true, c = true, x = false }, -- " a) +I => Don't give the intro message when starting Vim |:intro|. b) +c => Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc. c) -x => Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions.
      showbreak = "↪ ",
      showmatch = true,
      sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the right of the cursor
      signcolumn = "yes:1",
      softtabstop = 2, -- how many spaces to insert with tab key
      spelloptions = vim.opt.spelloptions + { "camel" },
      suffixes = { -- (((
        "*.aux",
        "*.bak",
        "*.bbl",
        "*.dvi",
        "*.info",
        "*.log",
        "*.old",
        "*.out",
        "*.swp",
        "*/.log",
        "*/.out",
        "~",
      }, -- This gives files lower priority, instead of outright ignoring them )))
      synmaxcol = 300,
      tags = { "$HOME/.cache/nvim/tags" },
      timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds). AstroNvim sets this to 300.
      updatecount = 100, -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
      whichwrap = { -- (((
        ["<"] = true,
        [">"] = true,
        ["["] = true,
        ["]"] = true,
        ["b"] = true,
        ["h"] = true,
        ["l"] = true,
        ["s"] = true,
      }, -- )))
      wildignore = { -- (((
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
        "*.ini",
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
        "~$",
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
      }, -- Ignore the following type of files when tab completing. There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions. )))
      wildignorecase = true, -- If supported, make wildmenu completions case-insensitive
      winaltkeys = "no",
      winminheight = 0, -- Default is 1. The minimal height of a window, when it's not the current window.
      wrap = true,

      -- Commented-out settings (((

      -- breakat = " \t;:,!?", -- which characters might cause a line break if 'linebreak' is on.
      -- foldopen=all, -- helps to avoid automatic closing of previously open folds when returning to a buffer
      -- guifont = "monospace:h17", -- the font used in graphical neovim applications
      -- inccommand = "split",
      -- jumpoptions = "view",
      -- listchars = { tab = "▸", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
      -- numberwidth = 4, -- set number column width
      -- scrolljump = 3,  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
      -- sidescroll = 3,  -- The minimal number of columns to scroll horizontally
      -- spell = true,
      -- spelllang = "en_gb",
      -- tagcase = "smart",
      -- tildeop = yes, -- when on: The tilde command "~" behaves like an operator

      -- )))
    }, -- )))

    -- 'vim.g.' settings (((

    g = {
      -- autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      -- cmp_enabled = true, -- enable completion at start
      -- autopairs_enabled = true, -- enable autopairs at start
      -- diagnostics_enabled = true, -- enable diagnostics at start
      -- status_diagnostics_enabled = true, -- enable diagnostics in statusline
      -- icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      -- ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      detectspelllang_langs = { -- (((
        aspell = { -- (((
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
        }, -- )))
        hunspell = { -- (((
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
        }, -- )))
      }, -- )))
      did_install_default_menus = 1,
      did_install_syntax_menu = 1,
      did_load_ftplugin = 1,
      loaded_matchparen = 1,
      loaded_node_provider = 0, -- To disable node support
      loaded_perl_provider = 0, -- To disable perl support
      loaded_python_provider = 0,
      loaded_ruby_provider = 0, -- To disable Ruby support
      loaded_shada_plugin = 1,
      loaded_spellfile_plugin = 1,
      matchup_matchparen_deferred = 1,
      matchup_matchparen_enabled = 0,
      matchup_matchparen_offscreen = { method = "popup" },
      matchup_override_vimtex = 1,
      matchup_surround_enabled = true,
      netrw_nogx = 1,
      -- python3_host_prog = "python3",
      -- python_host_skip_check = 1,
      skip_loading_mswin = 1,
      tex_flavor = "latex", -- vimtex already sets this up
      tex_comment_nospell = 1, -- spell checking be disabled in comments in LaTeX files
      tex_conceal = "abdmgs", --  a = accents/ligatures b = bold and italic d = delimiters m = math symbols g = Greek s = superscripts/subscripts
      tex_fold_enabled = 1, -- will only work if foldmethod=syntax
      tex_isk = "48-57,a-z,A-Z,192-255,:,_", -- Normally, LaTeX keywords support 0-9, a-z, A-z, and 192-255 only.
      tex_nospell = 1, -- don't want spell checking anywhere in LaTeX document
      tex_stylish = 1, -- One may use "\makeatletter" in *.tex files, thereby making the use of "@" in commands available.  However, since the *.tex file doesn't have one of the following suffices: sty cls clo dtx ltx, the syntax highlighting will flag such use of @ as an error. Putting "let g:tex_stylish=1" into your vimrc will make <syntax/tex.vim> always accept such use of @.
      tex_verbspell = 0, -- Often verbatim regions in a LaTeX doc are used for things like source code; seldom does one want source code spell-checked.
      markdown_enable_folding = 1,
      markdown_folding = 1,
      vimsyn_folding = "af",
      xml_syntax_folding = 1,
      javaScript_fold = 1,
      sh_fold_enabled = 7,
      ruby_fold = 1,
      perl_fold = 1,
      perl_fold_blocks = 1,
      r_syntax_folding = 1,
      rust_fold = 1,
      php_folding = 1,
    },

    -- )))
  })
end

-- g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }
-- set path+=$PWD/**
-- set path+=/usr/local/include
-- https://discord.com/channels/939594913560031363/942007419050029086/1012745700301353121 (start of AstroNvim 2.0/neovim 0.8 discussion)
