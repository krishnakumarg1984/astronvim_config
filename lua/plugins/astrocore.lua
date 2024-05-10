-- vim: ft=lua:foldmarker=(((,))):shiftwidth=2:softtabstop=2:tabstop=2

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- ╭─────────────────────────────────────────────────────────╮
-- │ AstroCore provides a central place to modify mappings,  │
-- │ vim options, autocommands, and more! Configuration      │
-- │ documentation can be found with `:h astrocore`          │
-- │ NOTE: We highly recommend setting up the Lua Language   │
-- │ Server (`:LspInstall lua_ls`) as this provides          │
-- │ autocomplete and documentation while editing            │
-- ╰─────────────────────────────────────────────────────────╯

local astro = require "astrocore"

-- https://code.mehalter.com/AstroNvim_user/~files/v4/lua/plugins/astrocore.lua
local function yaml_ft(path, bufnr) -- (((
  local buf_text = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
  if
    -- check if file is in roles, tasks, or handlers folder
    vim.regex("(tasks\\|roles\\|handlers)/"):match_str(path)
    -- check for known ansible playbook text and if found, return yaml.ansible
    or vim.regex("hosts:\\|tasks:"):match_str(buf_text)
  then
    return "yaml.ansible"
  elseif vim.regex("AWSTemplateFormatVersion:"):match_str(buf_text) then
    return "yaml.cfn"
  else -- return yaml if nothing else
    return "yaml"
  end
end -- )))

---@type AstroCoreOpts
local opts = { -- (((
  rooter = {
    ignore = { servers = { "julials" } },
    autochdir = true,
  },
  -- Configure core features of AstroNvim
  features = { -- (((
    large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
    autopairs = true, -- enable autopairs at start
    cmp = true, -- enable completion at start
    diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
    highlighturl = true, -- highlight URLs at start
    notifications = true, -- enable notifications at start
  }, -- )))
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = { -- (((
    underline = false,
    update_in_insert = false,
    virtual_lines = false,
    virtual_text = false,
  }, -- )))
  -- mappings, autocmds, extra filetypes, vim options and global variables can be configured here
  options = { -- (((
    -- vim options can be configured here
    opt = { -- vim.opt.<key>(((
      backupdir = vim.opt.backupdir - { "." },
      backupext = "nvimbackup",
      breakindentopt = { "shift:2", "sbr", "list:-1" }, -- https://vi.stackexchange.com/questions/9635/what-is-the-best-practice-in-vim8-for-wrapping-with-indentation-aka-breakindent
      clipboard = "",
      cmdheight = 1, -- until the cmdheight=0 bugs are squashed
      complete = vim.opt.complete + { "i" },
      -- conceallevel = 2, -- enable conceal
      cpoptions = vim.opt.cpoptions - { "a" }, -- Stop the :read command from annoyingly setting the alternative buffer
      cursorlineopt = "number",
      exrc = true,
      fileformats = vim.opt.fileformats + { "mac" }, -- This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer
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
      foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
      foldmethod = "expr",
      foldopen = vim.opt.foldopen + { "jump" },
      -- formatoptions = vim.opt.formatoptions - { "o" },
      inccommand = "split",
      isfname = vim.opt.isfname - { ",", "=" }, -- When using commands like Ctrl-x Ctrl-f for filename completion, do not read equal signs as part of file names, a common nuisance when working with shell scripts
      iskeyword = vim.opt.iskeyword + { "-" },
      list = true,
      listchars = { tab = "→ ", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
      matchtime = 3, -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.
      number = true, -- sets vim.opt.number
      pumwidth = 35,
      report = 0, -- Threshold for reporting number of lines changed.
      scrolloff = 2, -- Minimal number of screen lines to keep above and below the cursor
      shiftround = true,
      shiftwidth = 2,
      showbreak = "↪ ",
      showmatch = true,
      showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
      sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the right of the cursor
      signcolumn = "yes:1",
      softtabstop = 2, -- how many spaces to insert with tab key
      spell = false, -- sets vim.opt.spell
      spelloptions = vim.opt.spelloptions + { "camel" },
      splitkeep = "screen",
      suffixes = { -- (((
        "*.aux",
        "*.nvimbackup",
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
      swapfile = false,
      synmaxcol = 300,
      tabstop = 2,
      tags = { "$HOME/.cache/nvim/tags" },
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
      wildignore = { -- ((( Ignore the following type of files when tab completing. There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
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
      }, -- )))
      wildignorecase = true, -- If supported, make wildmenu completions case-insensitive
      winaltkeys = "no",
      winminheight = 0, -- Default is 1. The minimal height of a window, when it's not the current window.
      wrap = true, -- soft wrap lines
      -- breakat = " \t;:,!?", -- which characters might cause a line break if 'linebreak' is on.
      -- foldcolumn = "4",
      -- foldlevel = 2, -- Sets the fold level. Folds with a higher level will be closed. Setting this option to zero will close all folds.  Higher numbers will close fewer folds. This option is set by commands like |zm|, |zM| and |zR|. See |fold-foldlevel|.
      -- foldlevelstart = 2,
      -- foldopen=all, -- helps to avoid automatic closing of previously open folds when returning to a buffer
      -- guifont = "monospace:h17", -- the font used in graphical neovim applications
      -- history = 10000,
      -- inccommand = "split",
      -- jumpoptions = "view",
      -- lazyredraw = true, -- Don't redraw the screen during batch execution
      -- listchars = { tab = "▸", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
      -- path+=$PWD/**
      -- path+=**    " Search current directory's whole tree
      -- path+=/usr/local/include
      -- rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) -- Probably overridden by status-line plugins
      -- scrolljump = 3,  -- How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
      -- shortmess = vim.opt.shortmess + { I = true, c = true, x = false }, -- " a) +I => Don't give the intro message when starting Vim |:intro|. b) +c => Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc. c) -x => Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions.
      -- showtabline = 0, -- don't show tabline
      -- sidescroll = 3,  -- The minimal number of columns to scroll horizontally
      -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      -- spell = true,
      -- spelllang = "en_gb",
      -- tagcase = "smart",
      -- tildeop = yes, -- when on: The tilde command "~" behaves like an operator
    }, -- )))
    -- vim global variables can be configured here
    g = { -- vim.g.<key> (((
      -- configure global vim variables (vim.g)
      -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
      -- This can be found in the `lua/lazy_setup.lua` file
      -- python3_host_prog = "python3",
      -- python_host_skip_check = 1,
      -- did_install_default_menus = 1, -- useful in guis
      -- did_install_syntax_menu = 1, -- useful in guis
      -- javaScript_fold = 1, -- is this actually useful?
      loaded_python3_provider = 0,
      loaded_ruby_provider = 0, -- To disable Ruby support
      -- matchup_matchparen_deferred = 1, -- problematic due to upstream bug
      matchup_matchparen_offscreen = { method = "popup" },
      matchup_override_vimtex = 1,
      matchup_surround_enabled = true,
      -- netrw_nogx = 1,
      tex_comment_nospell = 1, -- spell checking be disabled in comments in LaTeX files
      tex_conceal = "abdmgs", --  a = accents/ligatures b = bold and italic d = delimiters m = math symbols g = Greek s = superscripts/subscripts
      tex_flavor = "latex", -- vimtex already sets this up
      tex_fold_enabled = 1, -- will only work if foldmethod=syntax
      tex_isk = "48-57,a-z,A-Z,192-255,:,_", -- Normally, LaTeX keywords support 0-9, a-z, A-z, and 192-255 only.
      tex_nospell = 1, -- don't want spell checking anywhere in LaTeX document
      tex_stylish = 1, -- One may use "\makeatletter" in *.tex files, thereby making the use of "@" in commands available.  However, since the *.tex file doesn't have one of the following suffices: sty cls clo dtx ltx, the syntax highlighting will flag such use of @ as an error. Putting "let g:tex_stylish=1" into your vimrc will make <syntax/tex.vim> always accept such use of @.
      tex_verbspell = 0, -- Often verbatim regions in a LaTeX doc are used for things like source code; seldom does one want source code spell-checked.
      vimsyn_folding = "af",
      rust_fold = 1,
    }, -- )))
  }, -- )))
  -- Mappings can be configured through AstroCore as well.
  -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
  mappings = { -- (((
    -- first key is the mode
    -- c = { -- (((
    --   ["<C-n>"] = { "<Down>" },
    --   ["<C-p>"] = { "<Up>" },
    -- }, -- )))
    i = { -- (((
      ["<c-c>"] = { "<ESC>" }, -- ctrl-c does not trigger InsertLeave event autocmd. Map to <ESC>
    }, -- )))
    n = { -- (((
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<Leader>bD"] = { -- (((
        function()
          require("astroui.status.heirline").buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
        end,
        desc = "Pick to close",
      }, -- )))

      -- tables with just a `desc` key will be registered with which-key if it's installed. this is useful for naming menus
      -- disable certain remaps provided in base AstroNvim (((
      ["<C-q>"] = false,
      ["<Leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
      ["<Leader>e"] = { false, desc = " Explorer" },
      ["<leader>gh"] = false, -- originally reset_hunk
      ["<leader>gs"] = false, -- originally stage_hunk
      ["<Leader>lS"] = false,
      ["<Leader>n"] = false,
      ["<Leader>o"] = { false, desc = " Overseer" },
      ["<Leader>q"] = false,
      ["<Leader>w"] = false,
      ["\\"] = false,
      ["|"] = false,
      -- ["<Leader>o"] = false,
      -- ["{"] = false,
      -- ["}"] = false,
      -- )))
      -- normal mode keymaps for built-in neovim functionality/features (((
      ["'"] = { "`" },
      ["<C-]>"] = { "g<C-]>" }, -- show options if tag has multiple candidates
      ["<c-w>%"] = { "<c-w>t<c-w>H", desc = "Change split to vertical" }, -- change a horizontal split to vertical
      ['<c-w>"'] = { "<c-w>t<c-w>K", desc = "Change split to horizontal" }, -- change a vertical split to horizontal
      ["<C-w>f"] = { "<C-w>vgf", desc = "Open in vertical split" }, -- is a more generic mode remap
      ["<C-w>z"] = { "<C-w>|<C-w>_", desc = "Maximize screen" }, -- zoom full-screen by maximising the screen height and width
      ["<Leader>*"] = { ":%s/<<c-r><c-w>>//g<left><left>", desc = "Replace cursor word" },
      ["<S-j>"] = { "mzJ`z" },
      ["<Space>"] = { "za" },
      -- ["<Leader>D"] = { "<cmd>window diffthis<CR>", desc = "Diff buffers" },
      -- ["<S-j>"] = { "mzJ`zmz" },
      -- ["N"] = { "Nzzzv" },
      -- ["N"] = { utils.better_search "N", desc = "Previous search" }, -- better search
      -- ["n"] = { "nzzzv" },
      -- ["n"] = { utils.better_search "n", desc = "Next search" }, -- better search
      -- )))
      -- bundled AstroNvim plugin keymaps for normal mode (((
      -- 'stevearc/aerial.nvim' mappings for normal mode (((
      -- Neovim plugin for a code outline window

      ["<Leader>A"] = { desc = " Symbol tree" },
      ["<Leader>AA"] = { "<cmd>AerialToggle<cr>", desc = "Toggle outline (focus)" },
      ["<Leader>Ac"] = { "<cmd>AerialClose<cr> | let g:aerial_open_automatic = 0<cr>", desc = "Close outline" },
      ["<Leader>An"] = { "<cmd>AerialNext<cr>", desc = "Next symbol" },
      ["<Leader>Ao"] = { "<cmd>AerialOpen!<cr> | let g:aerial_open_automatic = 1<cr>", desc = "Open outline" },
      ["<Leader>Ap"] = { "<cmd>AerialPrev<cr>", desc = "Prev symbol" },

      -- )))
      -- 'nvim-neo-tree/neo-tree.nvim' keymaps for normal mode (((
      -- Neovim plugin to manage the file system and other tree like structures.

      ["<Leader>ee"] = { "<cmd>Neotree action=show toggle=true<CR>", desc = "Toggle explorer" },
      ["<Leader>ef"] = { "<cmd>Neotree action=show focus<CR>", desc = "Focus explorer" },

      -- )))
      -- 'stevearc/overseer.nvim' keymaps (partial list) for normal mode (((
      -- ["<Leader>o"] = { "<cmd>Neotree action=show toggle=true<CR>", desc = "Toggle explorer" },
      -- )))
      -- 'mrjones2014/smart-splits.nvim' keymaps for normal mode (((
      -- Smart, seamless, directional navigation and resizing of Neovim + terminal multiplexer splits. Supports tmux, Wezterm, and Kitty. Think about splits in terms of "up/down/left/right".

      ["<A-h>"] = { function() require("smart-splits").resize_left(2) end },
      ["<A-j>"] = { function() require("smart-splits").resize_down(2) end },
      ["<A-k>"] = { function() require("smart-splits").resize_up(2) end },
      ["<A-l>"] = { function() require("smart-splits").resize_right(2) end },

      -- )))
      -- 'akinsho/toggleterm.nvim' keymaps for normal mode (((
      -- A neovim lua plugin to help easily manage multiple terminal windows

      ["<M-t>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal (float)" },
      ["<C-`>"] = { "<cmd>ToggleTerm direction=horizontal size=7<cr>", desc = "Toggle terminal (horizontal)" },
      ["<Leader>g<s-u>"] = { function() astro.toggle_term_cmd "gitui" end, desc = "GitUI" },

      -- )))
      -- 'nvim-telescope/telescope.nvim' keymaps for normal mode (((

      -- ["<leader>lI"] = { "<cmd>Telescope implementations<CR>", desc = "Implementations" },
      ["<leader>f:"] = { "<cmd>Telescope command_history<CR>", desc = "Command history" },
      ["<Leader>fA"] = { "<cmd>Telescope autocommands<CR>", desc = "Find autocommands" },
      ["<Leader>fg"] = { "<cmd>Telescope git_files<CR>", desc = "Find git files" },
      ["<leader>fH"] = { "<cmd>Telescope search_history<CR>", desc = "Search history" },
      ["<Leader>fj"] = { "<cmd>Telescope jumplist<CR>", desc = "Find in jumplist" },
      ["<Leader>fl"] = { "<cmd>Telescope loclist<CR>", desc = "Find in loclist" },
      ["<Leader>fM"] = { "<cmd>Telescope marks<CR>", desc = "Find marks" },
      ["<Leader>fq"] = { "<cmd>Telescope quickfix<CR>", desc = "Find in quickfixlist" },
      ["<Leader>fQ"] = { "<cmd>Telescope quickfixhistory<CR>", desc = "Quickfix history" },
      ["<Leader>fs"] = { "<cmd>Telescope spell_suggest<CR>", desc = "Spell suggestions" },
      ["<Leader>fS"] = { "<cmd>Telescope treesitter<CR>", desc = "Treesitter nodes" },
      ["<Leader>fv"] = { "<cmd>Telescope vim_options<CR>", desc = "Find vim options" },
      ["<Leader>fy"] = { "<cmd>Telescope filetypes<CR>", desc = "Find filetypes" },
      ["<Leader>gS"] = { "<cmd>Telescope git_stash<CR>", desc = "Stash" },
      ["<Leader>lC"] = { "<cmd>Telescope lsp_incoming_calls<CR>", desc = "Callers list" },
      ["<Leader>lc"] = { "<cmd>Telescope lsp_outgoing_calls<CR>", desc = "Callees list" },
      ["<Leader>lm"] = { "<cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
      ["<leader>lt"] = { "<cmd>Telescope lsp_type_definitions<CR>", desc = "Type definitions" },
      ["<leader>lw"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },
      ["<leader>ly"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Dynamic workspace symbols" },

      -- )))
      -- )))
    },
    o = { -- (((
      -- line text-objects
      ["iL"] = { ":<C-u>normal! $v^<CR>", desc = "Inside line text object" },
      ["aL"] = { ":<C-u>normal! $v0<CR>", desc = "Around line text object" },
    }, -- )))
    t = { -- (((
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
      -- ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
      ["<C-`>"] = { "<cmd>ToggleTerm direction=horizontal size=7<cr>", desc = "Toggle terminal (horizontal)" },
      ["<C-BS>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
      ["<C-h>"] = false,
      ["<C-j>"] = false,
      ["<C-k>"] = false,
      ["<C-l>"] = false,
      ["<esc>"] = { "<C-\\><C-n>", silent = true },
      ["<M-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    }, -- )))
    v = { -- (((
      -- ["*"] = { "y/\\V<C-R>=escape(@\",'/')<CR><CR>" },
      -- ["cg*"] = { "\"ay/\\V<C-R>=escape(@a,'/')<CR><CR>N\"_cgn" },
      -- https://www.reddit.com/r/neovim/comments/ttwzge/magic_replace_selected_text_mapping_with_repeat/
      ["y"] = { "myy`ymy" },
      ["Y"] = { "myY`ymy" },
    }, -- )))
    x = { -- (((
      ["<"] = { "<gv" }, -- Stay in indent mode in visual-block mode
      [">"] = { ">gv" }, -- Stay in indent mode in visual-block mode
      -- line text-objects
      ["iL"] = { ":<C-u>normal! $v^<CR>", desc = "Inside line text object" },
      ["aL"] = { ":<C-u>normal! $v0<CR>", desc = "Around line text object" },
    }, -- )))
  }, -- )))
  -- easily configure auto commands
  autocmds = { -- (((
    -- list of auto commands to set
    -- first key is the `augroup` (:h augroup)
    nvimformatoptions = { -- (((
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
    }, -- )))
    highlightyank = { -- (((
      {
        event = { "TextYankPost" },
        pattern = "*",
        callback = function() vim.highlight.on_yank { higroup = "IncSearch", timeout = 650 } end,
        desc = "Highlight yanked text",
      },
    }, -- )))
    autoreadexternalchanges = { -- (((
      {
        event = { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" },
        pattern = "*",
        command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
        desc = "Trigger autoread when file changes on disk",
      },
    }, -- )))
    filechangedalert = { -- (((
      {
        event = { "FileChangedShellPost" },
        pattern = "*",
        command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
        desc = "Warn user about file changed on disk outside of neovim",
      },
    }, -- )))
    winfocuslost = { -- (((
      {
        -- https://www.reddit.com/r/neovim/comments/159bib0/comment/jtf40i4/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
        -- Save all buffers when focus lost, ignoring warnings, and return to normal mode.
        event = { "FocusLost" },
        callback = function()
          vim.cmd.stopinsert()
          vim.cmd.wall { mods = { silent = true } }
        end,
        desc = "Stop insert mode when focus is lost ",
      },
    }, -- )))
    autohide_tabline = { -- (((
      {
        event = "User",
        desc = "Auto hide tabline",
        pattern = "AstroBufsUpdated",
        callback = function()
          local new_showtabline = #vim.t.bufs > 1 and 2 or 1
          if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
        end,
      },
    }, -- )))
    -- autospellfortextfiles = { -- (((
    --   {
    --     event = { "FileType" },
    --     pattern = {
    --       "asciidoc",
    --       "changelog",
    --       "context",
    --       "gitcommit",
    --       "help",
    --       "lsp_markdown",
    --       "mail",
    --       "markdown",
    --       "NeogitCommit",
    --       "NeogitCommitMessage",
    --       "plaintex",
    --       "rst",
    --       "rtf",
    --       "texinfo",
    --       "text",
    --       "txt",
    --     },
    --     callback = function()
    --       -- vim.opt_local.wrap = true
    --       vim.opt_local.spell = true
    --     end,
    --     desc = "Enable wrap and spell for text like documents",
    --   },
    -- }, -- )))
    concellevelformarkdownfiles = { -- (((
      {
        event = { "FileType" },
        pattern = {
          "lsp_markdown",
          "markdown",
          "markdown_inline",
        },
        callback = function() vim.opt_local.conceallevel = 3 end,
        desc = "Set conceallevel to 3 for markdown files",
      },
    }, -- )))
    nexthelptag = { -- (((
      {
        event = { "FileType" },
        pattern = { "help", "quickfix", "vim", "vimdoc" },
        callback = function()
          vim.keymap.set("n", "<Leader>Tn", [[/|.\zs\S\{-}|/<cr>zz]], { buffer = true, noremap = true })
          -- vim.opt_local.list = false
          vim.opt_local.list = false
          -- vm.wo.list = false
          -- vim.bo.list = false
        end,
        desc = "Next help tag",
      },
    }, -- )))
  }, -- )))
  -- passed to `vim.filetype.add`
  filetypes = { -- (((
    -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/filetype.lua
    -- see `:h vim.filetype.add` for usage
    extension = { -- (((
      -- make = "make",
      cl = "opencl",
      dvc = "yaml",
      frag = "glsl",
      fs = "glsl",
      geom = "glsl",
      gs = "glsl",
      jl = "julia",
      luatodo = "lua",
      mdx = "markdown.mdx",
      pd_lua = "lua",
      pd_luax = "lua",
      qmd = "markdown",
      vert = "glsl",
      vs = "glsl",
      yaml = yaml_ft,
      yml = yaml_ft,
    }, -- )))
    filename = { -- (((
      [".codespellrc"] = "confini",
      [".dace.conf"] = "yaml",
      [".envrc"] = "sh",
      ["/etc/environment"] = "confini",
      ["/etc/mkinitcpio.conf"] = "confini",
      ["devcontainer.json"] = "jsonc",
      ["dvc.lock"] = "yaml",
      ["Dvcfile"] = "yaml",
      ["launch.json"] = "jsonc",
      ["spack.lock"] = "json",
      ["tasks.json"] = "jsonc",
      ["zuliprc"] = "confini",
    }, -- )))
    pattern = { -- (((
      ["/tmp/neomutt.*"] = "markdown",
      -- [vim.env.XDG_CONFIG_HOME .. "/udev/rules.d/.*%.rules"] = "udevrules",
    }, -- )))
  }, -- )))
} -- )))

local function better_search(key) -- (((
  return function()
    local searched, error =
      pcall(vim.cmd.normal, { args = { (vim.v.count > 0 and vim.v.count or "") .. key }, bang = true })
    if not searched and type(error) == "string" then require("astrocore").notify(error, vim.log.levels.ERROR) end
  end
end -- )))
opts.mappings.n.n = { better_search "n", desc = "Next search" }
opts.mappings.n.N = { better_search "N", desc = "Previous search" }

-- add line text object (((
for lhs, rhs in pairs {
  il = { ":<C-u>normal! $v^<CR>", desc = "inside line" },
  al = { ":<C-u>normal! V<CR>", desc = "around line" },
} do
  opts.mappings.o[lhs] = rhs
  opts.mappings.x[lhs] = rhs
end
-- )))

-- add missing in between and around two character pairs (((
for _, char in ipairs { "_", "-", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for lhs, rhs in pairs {
    ["i" .. char] = { (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char), desc = "inside " .. char },
    ["a" .. char] = { (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char), desc = "around " .. char },
  } do
    opts.mappings.o[lhs] = rhs
    opts.mappings.x[lhs] = rhs
  end
end
-- )))

---@type LazySpec
return { "AstroNvim/astrocore", opts = opts } -- Core AstroNvim configuration engine

-- C = { name = "󱣘 Crates" },
-- L = { name = " LC" },
-- n = { name = " Annotate" },
-- o = { name = " Overseer" },
-- q = { name = " Quickfix" },
-- v = { name = " LaTeX" },
-- x = { name = "󰲉 Diagnostics" },
-- z = { name = " Testing" },
-- Commented-out mappings (((

-- Commented-out vimscript mappings (((
--
-- " nnoremaps
--
-- " https://www.reddit.com/r/vim/comments/oyqkkd/comment/h7x83ce/?utm_source=share&utm_medium=web2x&context=3
-- " Basically, it makes '0' act like '^' on first press, and then like '0' on " second press.
-- " So if I press 0, I go back to indentation. If I press 0 " again, I go to the first column of the line.
-- " And if I continue pressing " zero, it switches between the first column and the first character.
-- " nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
--
-- " https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/?sort=old
-- " nnoremap g. /\V\C<C-r>"<CR>cgn<C-a><Esc>
-- " nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>
--
-- " nmap cg* *Ncgn
--
-- "
--
-- " Substitute word under cursor and dot repeat
--
-- " https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
-- " nnoremap <silent> \\C :let @/='\<'.expand('<cword>').'\>'<CR>cgn
-- " nnoremap <leader><leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
-- " xnoremap <silent> \\C "sy:let @/=@s<CR>cgn
--
--
-- )))

-- Commented-out lua mappings (((

-- local function show_documentation()
--   local filetype = vim.bo.filetype
--   if vim.tbl_contains({ "vim", "help" }, filetype) then
--     vim.cmd("h " .. vim.fn.expand "<cword>")
--   elseif vim.tbl_contains({ "man" }, filetype) then
--     vim.cmd("Man " .. vim.fn.expand "<cword>")
--   elseif vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
--     require("crates").show_popup()
--   else
--     vim.lsp.buf.hover()
--   end
-- end
--
-- vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })

-- )))

-- )))

-- telescope config to use (((
-- -- https://gitlab.com/HiPhish/nvim-config/-/blob/master/plugin/telescope.lua
-- defaults = {
--   -- winblend = 30,
--   -- border = true,
--   file_ignore_patterns = {
--     "%.zip$",
--     "%.tar$",
--     "%.tar.gz$",
--     "%.so$",
--     "%.a$",
--     "%.fasl$",
--     "%.pyc$",
--     "%.whl$",
--     "%.bin$",
--     "%.db$",
--     "node_modules",
--   },
-- },
-- pickers = {
--   -- find_files = {
--   --   hidden = true,
--   -- },
--   diagnostics = { theme = "dropdown" },
--   -- diagnostics = { layout = { "vertical" } },
--   git_status = { theme = "ivy" },
-- },

-- )))
