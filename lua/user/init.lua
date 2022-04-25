-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- Default theme configuration
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

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = false,
    which_key = true,
    neoscroll = true,
    ts_rainbow = false,
    ts_autotag = true,
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
      -- { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } },
      { "tyru/capture.vim", cmd = { "Capture" } },
      { "kenn7/vim-arsync", cmd = { "ARshowConf", "ARsyncUp", "ARsyncUpDelete", "ARsyncDown" } },
      { "tpope/vim-unimpaired", keys = { "[", "]" } },
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
        requires = { "mfussenegger/nvim-dap" }
      },
      {
        "nkakouros-original/numbers.nvim",
        event = "InsertEnter",
        config = function()
          require("numbers").setup({
            excluded_filetypes = {
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
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
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

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  -- null-ls configuration
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

  -- This function is run last (good place to configure mappings and vim options)
  polish = function()

    -- options/settings (((

    vim.g.mapleader = "\\"

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
    let g:did_indent_on             = 1
    let g:did_load_ftplugin         = 1
    let g:skip_loading_mswin        = 1

    let g:loaded_2html_plugin       = 1

    " I manage plugins myself with Git
    let g:loaded_getscript          = 1
    let g:loaded_getscriptPlugin    = 1

    " I prefer filtering text with Unix tools
    let g:loaded_logiPat            = 1
    let g:loaded_logipat            = 1

    " let g:loaded_man                = 1
    " let g:loaded_matchit            = 1
    let g:loaded_matchparen         = 1

    " I don't use Vim servers
    let g:loaded_rrhelper           = 1

    let g:loaded_shada_plugin       = 1
    let g:loaded_spellfile_plugin   = 1
	  let g:loaded_remote_plugins     = 1
    let g:loaded_tutor_mode_plugin  = 1
    let g:loaded_vimball            = 1
    let g:loaded_vimballPlugin      = 1

    " Vim is the wrong tool for reading archives or compressed text
    let g:loaded_gzip               = 1
	  let g:loaded_tar                = 1
    let g:loaded_tarPlugin          = 1
    let g:loaded_zip                = 1
    let g:loaded_zipPlugin          = 1

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

    let g:cursorhold_updatetime   = 100

    " )))

    " Diff-mode settings (((

    set diffopt+=vertical,foldcolumn:0,context:3,iwhiteall,hiddenoff
    " set diffopt+=internal,indent-heuristic,algorithm:histogram
    set diffopt+=indent-heuristic,algorithm:patience

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

    set virtualedit+=block " Allow movement beyond buffer text only in visual block mode

    " Settings for grepprg and grepformat (((

    if executable('rg')
      set grepprg=rg\ -H\ --no-heading\ --vimgrep
      set grepformat^=%f:%l:%c:%m
    endif

    " )))

    " Other non-conditional settings/declarations (set xxxxxxx) (((

    set fileformats=unix,dos,mac " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer:
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " Probably overridden by status-line plugins

    " set colorcolumn=99999 " fixes indentline for now
    set cpoptions-=a      " Stop the :read command from annoyingly setting the alternative buffer
    set isfname-={,}
    set isfname-==
    " set path+=**          " Search current directory's whole tree

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

    " nnoremaps (((

    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    " )))

    " replace the word under cursor
    nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

    noremap <c-w>" <c-w>t<c-w>K     " change vertical to horizontal with -
    noremap <c-w>% <c-w>t<c-w>H    " change horizontal to vertical with %

    " Remap 'gx' for opening the URL under cursor on macOS (((

    " https://github.com/vim/vim/issues/4738
    if has('macunix')
      function! OpenURLUnderCursor()
        let s:uri = expand('<cWORD>')
        let s:uri = substitute(s:uri, '?', '\\?', '')
        let s:uri = shellescape(s:uri, 1)
        if s:uri != ''
          silent exec "!open '".s:uri."'"
          :redraw!
        endif
      endfunction
      nnoremap gx :call OpenURLUnderCursor()<CR>
    endif

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

    " highlight clear SignColumn     " SignColumn should match background,SignColumn is the column where |signs| are displayed
    " highlight Comment cterm=italic gui=italic
    " 
    " highlight link HelpBar Normal
    " highlight link HelpStar Normal
    " 
    " highlight OverLength ctermfg=0 ctermbg=3
    " match OverLength /\%121v/

    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Nobody wants to commit merge conflict markers, so let’s highlight these so we can’t miss them: https://vimways.org/2018/vim-and-git/

    " )))

    " shortmess settings (((

    set shortmess+=I  " Don't give the intro message when starting Vim |:intro|.
    set shortmess+=c  " Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc.
    set shortmess-=x  " Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions

    " )))

    if executable('nvr')
      let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
      let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    endif

    set tags=~/.cache/tags

    ]])

    -- )))

    -- options (lua-based) (((

    local set = vim.opt
    -- NOTE: only my preferred settings that are not set by AstroNvim are set here

    vim.g.python3_host_prog = 'python3'
    vim.g.ale_disable_lsp = 1


    -- Backup-related settings (((

    set.backupdir:remove { "." }
    set.backupext = 'nvimbackup'

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

    -- set.conceallevel = 0,      -- so that `` is visible in markdown files
    -- set.showmode = false,      -- we don't need to see things like -- INSERT -- anymore

    -- set.Backup settings (((
    -- set.backup = false,       -- creates a backup file
    -- set.writebackup = false,  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

    -- )))

    -- )))

    -- Case-sensitivity options (((

    set.infercase = true -- Ignore case on insert completion. When doing keyword completion in insert mode |ins-completion|, and 'ignorecase' is also on, the case of the match is adjusted depending on the typed text.

    -- )))

    -- Tab settings: shiftwidth, tabstop, softtabstop (((

    set.softtabstop = 2 -- how many spaces to insert with tab key

    -- )))

    -- Indent settings (((

    -- Basic indent settings (((

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

    -- swapfile, updatecount and updatetime (((

    set.updatecount = 100 -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).

    -- )))

    -- cursorline settings (((

    set.cursorlineopt = "number"

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

    -- )))

    -- Settings for showing matching parenthesis (((

    set.showmatch = true
    set.matchtime = 3 -- Tenths of a second to show the matching paren, when 'showmatch' is set.  Note that this is not in milliseconds, like other options that set a time.

    -- )))

    -- All other settings (((

    set.clipboard = ""
    set.confirm = true -- Give me a prompt instead of just rejecting risky :write, :saveas
    set.guifont = "monospace:h17" -- the font used in graphical neovim applications
    set.iskeyword:append { "-" }
    set.lazyredraw = true -- Don't redraw the screen during batch execution
    set.list = true
    -- set.numberwidth = 4 -- set number column width
    set.pumwidth = 35
    set.report = 0 -- Threshold for reporting number of lines changed.
    -- set.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds). set to 300 by AstroNvim
    set.winaltkeys = "no"
    set.wildignorecase = true -- If supported, make wildmenu completions case-insensitive

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
      autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 

      " Press Enter to follow a help tag
      autocmd FileType help nnoremap <buffer><CR> <c-]>

      " Press Backspace to go back to the location of the previous tag
      autocmd FileType help nnoremap <buffer><BS> <c-T>

      autocmd FileType help setlocal number
      autocmd FileType help setlocal relativenumber

      " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
      autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

      " autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 400})
      autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=650 }

      " autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
      " autocmd BufWinEnter *.txt set iskeyword+=- iskeyword+=: iskeyword+=.

      autocmd BufWinEnter * :set formatoptions-=cro
      autocmd FileType qf set nobuflisted

      autocmd FileType mail,rst,text,yaml,toml,tex,txt setlocal spell

    augroup end

    " )))

    " augroups for individual filetypes (((

    augroup _git
      autocmd!
      autocmd FileType gitcommit setlocal wrap
      autocmd FileType gitcommit setlocal spell
    augroup end

    augroup _markdown
      autocmd!
      autocmd FileType markdown setlocal wrap
      autocmd FileType markdown setlocal spell
    augroup end

    " )))

    augroup _auto_resize
      autocmd!
      autocmd VimResized * tabdo wincmd = 
    augroup end

    " Autocommand to set commentstring for various buffer types (((

    " augroup _setcommentstring
    "   autocmd!
    "   autocmd BufEnter,BufFilePost *.cpp,*.h setlocal commentstring=//\ %s

    "   " https://github.com/tpope/vim-commentary/issues/85
    "   autocmd FileType xdefaults setlocal commentstring=!\ %s
    " augroup END

    " )))

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

    " Autocommand for remembering cursor position (((

    augroup vimrc-remember-cursor-position
      autocmd!
      autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END

    " )))

    " Autocommand to stop insert when focus is lost (((

    augroup FocusLostAucmd
      autocmd!
      autocmd FocusLost * stopinsert
    augroup END

    " )))

    " Autocommands for LaTeX filetype (((

    augroup LaTeXSettings
      autocmd!
      " autocmd FileType tex setlocal scrollbind
      autocmd FileType tex setlocal foldcolumn=auto:7
      autocmd InsertEnter *.tex set conceallevel=0
      autocmd InsertLeave *.tex set conceallevel=2
    augroup END

    " )))

    ]]

    -- )))

    -- custom filetypes (lua-based) (((

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

    local map = vim.keymap.set

    -- map("n", "<C-s>", ":w!<CR>")

    -- )))

    end,
  }

return config
