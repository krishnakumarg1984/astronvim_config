-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:
-- Last full review on: Nov 12, 2023

-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure things like custom filetypes.
-- This is just pure lua so anything that doesn't fit in the normal config locations above can go here

-- Mappings for MULTIPLE vim-modes. Disable some unnecessary/confusing neovim-default mappings (((

vim.keymap.set({ "n", "i" }, "<f1>", "<Nop>")
vim.keymap.set({ "n", "i", "x" }, "<C-s>", "<Nop>")
vim.keymap.set({ "n", "i", "t" }, "<F7>", "<Nop>")
vim.keymap.set({ "n", "i", "t" }, "<C-'>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Leader>/", "<Nop>")
-- vim.keymap.set({ "n", "x" }, "s", "<Nop>") -- Disable 's' as recommended by sandwich.vim help file
vim.keymap.set({ "n", "x" }, "&", ":&&<CR>") -- Remap normal/visual '&' to preserve substitution flags

-- )))

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "black", bold = true }) -- https://www.reddit.com/r/neovim/comments/tpmnlv/psa_make_your_window_separator_highlight_bold_of/ Set `fg` to the color you want your window separators to have

-- https://github.com/neovim/neovim/issues/20672#issuecomment-2096976125
-- https://github.com/neovim/neovim/issues/21403#issuecomment-1376905921
local term_clear = function()
  vim.fn.feedkeys("", "n")
  local sb = vim.bo.scrollback
  vim.bo.scrollback = 1
  vim.bo.scrollback = sb
end

vim.keymap.set("t", "<C-l>", term_clear)

-- Vimscript-based mappings, user-commands and autocommands (((

vim.cmd [[

" Vimscript-based mappings (((

" cnoreabbrev mappings (((

" Replace :w with :up
cnoreabbrev <expr> w getcmdtype() == ":" && getcmdline() == 'w' ? 'up' : 'w'

" https://stackoverflow.com/questions/3131393/remapping-help-in-vim-to-open-in-a-new-tab
" cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
" cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
" cnoreabbrev <expr> helpgrep getcmdtype() == ":" && getcmdline() == 'helpgrep' ? 'tab helpgrep' : 'helpgrep'
cnoreabbrev <expr> Man getcmdtype() == ":" && getcmdline() == 'Man' ? 'tab Man' : 'Man'

" )))

" Make jump-selections work better in visual block mode (((

xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

" )))

" )))

" vimscript-based user commands (((

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

  " Diff-mode settings (((

  set diffopt+=vertical,foldcolumn:0,context:2,iwhiteall,hiddenoff
  " set diffopt+=internal,indent-heuristic,algorithm:histogram
  " set diffopt+=indent-heuristic,algorithm:minimal
  set diffopt+=indent-heuristic

  " )))

  " Title (GUI/terminal) settings (((

  set title
  set titleold="Terminal"

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
    set grepprg=rg\ -H\ --no-heading\ --vimgrep\ --smart-case
    set grepformat^=%f:%l:%c:%m
  endif

  " )))

  " Dictionary settings (((

  if has('unix')
    silent! set dictionary+=/usr/share/dict/words
    silent! set dictionary+=/usr/share/dict/american-english
    silent! set dictionary+=/usr/share/dict/british-english
    " silent! set dictionary+=/usr/share/dict/cracklib-small
  endif

  " )))

  " Commented-out settings (((

" Custom highlights (((

" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Nobody wants to commit merge conflict markers, so let's highlight these so we can's them: https://vimways.org/2018/vim-and-git/

" )))

" )))

" )))

" vimscript-based autogroups & autocommands (((

" _general_settings autogroup (((

augroup _general_settings
  autocmd!

  " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
  " autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

  " https://stackoverflow.com/questions/4687009/opening-help-in-a-full-window
  " autocmd FileType help :tabnew % | tabprevious | quit | tabnext
  autocmd FileType help set buflisted number relativenumber

augroup end

" )))

" Resize splits in Vim automatically across tabs (((

" https://stackoverflow.com/a/70284879
function! ResizeWindows()
    let savetab = tabpagenr()
    tabdo wincmd =
    execute 'tabnext' savetab
endfunction
augroup _auto_resize
  autocmd!
  autocmd VimResized * call ResizeWindows()
augroup end

" )))

" )))

]]

-- )))
