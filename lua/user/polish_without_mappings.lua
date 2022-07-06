-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- This 'polish' function is run last
return function()
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "black", bold = true }) -- https://www.reddit.com/r/neovim/comments/tpmnlv/psa_make_your_window_separator_highlight_bold_of/ Set `fg` to the color you want your window separators to have

  vim.wo.colorcolumn = ""

  -- https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
  vim.wo.foldnestmax = 3
  -- vim.o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
  -- https://www.reddit.com/r/vim/comments/ogqarw/another_take_on_minimal_folds/h4l8j4z/
  vim.o.foldtext =
    [[printf('  %-4d %s', v:foldend - v:foldstart + 1, substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g')) . '  ' . trim(getline(v:foldend))]]
  -- [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

  -- Vimscript-based options (((

  vim.cmd [[

    " Linebreak settings (((

    set breakat=\ \ ;:,!? " which characters might cause a line break if 'linebreak' is on.
    set breakindentopt=shift:2,sbr,list:-1  " https://vi.stackexchange.com/questions/9635/what-is-the-best-practice-in-vim8-for-wrapping-with-indentation-aka-breakindent

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
    :let did_install_default_menus  = 1
    let g:did_install_syntax_menu   = 1
    :let did_install_syntax_menu    = 1
    " let g:did_indent_on             = 1    " raises an error: Vim(doautocmd):E216: No such group or event: filetypeindent FileType markdown
    let g:did_load_ftplugin         = 1
    let g:skip_loading_mswin        = 1

    " " I prefer filtering text with Unix tools
    let g:loaded_logiPat            = 1

    " let g:loaded_man      = 1
    " let g:loaded_matchit  = 1
    let g:loaded_matchparen = 1
    :let loaded_matchparen  = 1

    " I don't use Vim servers
    " let g:loaded_rrhelper = 1   " doesn't exist in neovim

    let g:loaded_shada_plugin       = 1
    let g:loaded_spellfile_plugin   = 1
    " let g:loaded_tutor_mode_plugin  = 1

    " let g:loaded_netrw              = 1
    let g:netrw_nogx                = 1

      let g:loaded_ruby_provider = 0  " To disable Ruby support
      :let g:loaded_perl_provider = 0 " To disable perl support
      :let g:loaded_node_provider = 0 " To disable Node.js support

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

    set diffopt+=vertical,foldcolumn:0,context:2,iwhiteall,hiddenoff
    " set diffopt+=internal,indent-heuristic,algorithm:histogram
    set diffopt+=indent-heuristic,algorithm:minimal

    " )))

    " " Settings for 'listchars' which define extra list display characters (((
    "
    " set listchars=
    " " set listchars+=tab:▸\     " Tab characters, preserve width
    " set listchars+=tab:→\     " Tab characters, preserve width
    " set listchars+=trail:·    " Trailing spaces
    " set listchars+=extends:>  " Unwrapped text to screen right
    " set listchars+=precedes:< " Unwrapped text to screen left
    " set listchars+=nbsp:␣
    "
    " " )))

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
    set isfname-==     " When using commands like Ctrl-x Ctrl-f for filename completion, do not read equal signs as part of file names, a common nuisance when working with shell scripts
    set isfname-={,}
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " Probably overridden by status-line plugins
    set virtualedit+=block " Allow movement beyond buffer text only in visual block mode

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

    " match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Nobody wants to commit merge conflict markers, so letâs highlight these so we canât miss them: https://vimways.org/2018/vim-and-git/

    " )))

    " shortmess settings (((

    set shortmess+=I  " Don't give the intro message when starting Vim |:intro|.
    set shortmess+=c  " Don't give |ins-completion-menu| messages.  For example, '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found', 'Back at original', etc.
    set shortmess-=x  " Uses [unix format], [dos format], [mac format] etc. instead of their shortened versions

    " )))

    set tags=~/.cache/tags

    ]]

  -- )))

  -- Autogroups & Autocommands (lua-based) (((

  -- Autogroup for Alpha bindings (((

  vim.api.nvim_create_augroup("alpha_bindings", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    desc = "Set alpha bindings",
    group = "alpha_bindings",
    pattern = "alpha",
    callback = function()
      vim.keymap.set("n", "q", "<cmd>enew<cr>", { buffer = 0 })
      vim.keymap.set("n", "<esc>", "<cmd>enew<cr>", { buffer = 0 })
    end,
  })

  -- )))

  -- Autogroup for automatically reload packer configs after saving (((

  -- vim.api.nvim_create_augroup("packer_conf", { clear = true })
  -- vim.api.nvim_create_autocmd("BufWritePost", {
  --   desc = "Sync packer after modifying init.lua",
  --   group = "packer_conf",
  --   pattern = "init.lua",
  --   command = "source <afile> | PackerSync",
  -- })

  -- )))

  -- )))

  -- Autocommands (vimscript-based) (((

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
    autocmd FileType gitcommit,help,NeogitCommit,NeogitCommitMessage setlocal nolist

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

    autocmd FileType asciidoc,changelog,context,gitcommit,NeogitCommit,NeogitCommitMessage,lsp_markdown,mail,markdown,rst,rtf,tex,texinfo,text,txt setlocal spell
    autocmd FileType gitcommit,NeogitCommit,NeogitCommitMessage setlocal wrap textwidth=80

    autocmd Filetype man setlocal nowrap

  augroup end

  " )))

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  " Autocommand to set ft to julia for files ending in .jl (((

  " augroup _julia
  "   autocmd!
  "   autocmd BufRead,BufNewFile *.jl set filetype=julia
  " augroup END

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
    autocmd InsertCharPre *.tex set conceallevel=0
    autocmd InsertLeave *.tex set conceallevel=2
  augroup END

  augroup FtLuaSettings
    autocmd!
    autocmd FileType lua setlocal foldcolumn=auto:7
  augroup END

  " )))

    " Autocommand for opening the quickfix window (((

    augroup my_quickfix
    autocmd!
    " autocmd QuickFixCmdPost [^l]* QFOpen!
    autocmd QuickFixCmdPost cexpr QFOpen
    " autocmd QuickFixCmdPost cexpr cwindow
    " autocmd QuickFixCmdPost l* nested lopen
    " https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
    " autocmd QuickFixCmdPost cgetexpr cwindow
    augroup END

    " )))

  nnoremap <Space> zA

  ]]

  -- )))

  -- Add custom filetypes (lua-based config from nvim 0.7+) (((

  -- vim.filetype.add {
  --   extension = {
  --     jl = "julia",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }

  -- )))
end -- end of 'polish' function
