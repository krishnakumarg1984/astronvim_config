-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- This 'polish' function is run last and is a good place to configuring augroups/autocommands and custom filetypes.
-- This is just pure lua, so anything that doesn't fit in the normal config locations above can go here
return function()
  if vim.fn.executable "blacktex" == 1 then
    vim.keymap.set("n", "<leader>vB", "my<cmd>%! blacktex %<CR>`y", { desc = "Blacktex (strip comments)" })
    vim.keymap.set(
      "n",
      "<leader>vb",
      "mz<cmd>%! blacktex --keep-comments %<CR>`z",
      { desc = "Blacktex (keep comments)" }
    )
  end
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "black", bold = true }) -- https://www.reddit.com/r/neovim/comments/tpmnlv/psa_make_your_window_separator_highlight_bold_of/ Set `fg` to the color you want your window separators to have

  -- https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
  -- https://www.reddit.com/r/vim/comments/ogqarw/another_take_on_minimal_folds/h4l8j4z/
  -- vim.o.foldtext =
  --   [[printf('  %-4d %s', v:foldend - v:foldstart + 1, substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g')) . '  ' . trim(getline(v:foldend))]]

  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("highlightyank", { clear = true }),
    pattern = "*",
    callback = function() vim.highlight.on_yank { higroup = "Search", timeout = 650 } end,
  })

  -- Vimscript-based options (((

  vim.cmd [[

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
    set diffopt+=indent-heuristic,algorithm:minimal

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
      set grepprg=rg\ -H\ --no-heading\ --vimgrep\ --smart-case
      set grepformat^=%f:%l:%c:%m
    endif

    " )))

    " Dictionary settings (((

    if has('unix')
      silent! set dictionary+=/usr/share/dict/words
      silent! set dictionary+=/usr/share/dict/american-english
      silent! set dictionary+=/usr/share/dict/british-english
      silent! set dictionary+=/usr/share/dict/cracklib-small
    endif

    " )))

    " Commented-out settings (((

  " Custom highlights (((

  " match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Nobody wants to commit merge conflict markers, so let's highlight these so we can's them: https://vimways.org/2018/vim-and-git/

  " )))

  " )))

    ]]

  -- )))

  -- Autogroups & Autocommands (lua-based) (((

  ---@diagnostic disable: missing-parameter
  -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/settings/autocmds.lua
  local aucmd = vim.api.nvim_create_autocmd
  local augroup = vim.api.nvim_create_augroup
  -- local auexec = vim.api.nvim_exec_autocmds
  -- local exec = vim.api.nvim_command
  local augrp_opts = { clear = true }

  augroup("FormatOptions", augrp_opts)

  aucmd("FileType", {
    group = "FormatOptions",
    callback = function()
      vim.opt.formatoptions = vim.opt.formatoptions
        - "a" -- Dont format pasted code
        - "t" -- Delegate to linter prgs/LSP. Disable 'auto-wrap text using textwidth'
        - "o" -- O and o don't continue comments
        - "r" -- Return does not continue comments
        -- + "c" -- comments respect textwidth
        -- + "q" -- Allow formatting comments w/ gq
        + "n" -- Recognize numbered lists.
        -- This actually uses the 'formatlistpat' option, thus any kind of list can be used. Helps to avoid joining distinct items as if they were a single paragraph.
        -- + "j" -- Auto-remove comments if possible.
        + "2" -- Indent according to 2nd line
    end,
    desc = "Custom formatoptions",
  })

  -- Autogroup for Alpha bindings (((

  -- augroup("alpha_bindings", augrp_opts)
  -- aucmd("FileType", {
  --   desc = "Set alpha bindings",
  --   group = "alpha_bindings",
  --   pattern = "alpha",
  --   callback = function()
  --     vim.keymap.set("n", "q", "<cmd>new<cr>", { buffer = 0 })
  --     vim.keymap.set("n", "<esc>", "<cmd>new<cr>", { buffer = 0 })
  --   end,
  -- })

  -- )))

  -- )))

  -- Autocommands (vimscript-based) (((

  vim.cmd [[

  " _general_settings autogroup (((

  augroup _general_settings
    autocmd!

    " ft help autocommands (((

    autocmd FileType qf,help,man,lspinfo,dap-float,neotest-summary nnoremap <silent> <buffer> q <cmd>close!<CR>

    " Press Enter to follow a help tag
    autocmd FileType help nnoremap <buffer><CR> <c-]>

    " Press Backspace to go back to the location of the previous tag
    autocmd FileType help nnoremap <buffer><BS> <c-T>

    " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
    autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

    autocmd FileType help setlocal number relativenumber
    autocmd FileType gitcommit,help,NeogitCommit,NeogitCommitMessage setlocal nolist

    " )))

    " autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
    " autocmd BufWinEnter *.txt set iskeyword+=- iskeyword+=: iskeyword+=.

    " autocmd BufWinEnter * set formatoptions-=cro

    " https://stackoverflow.com/questions/4687009/opening-help-in-a-full-window
    " autocmd FileType help :tabnew % | tabprevious | quit | tabnext
    autocmd FileType help set buflisted

    autocmd FileType qf set nobuflisted

    autocmd FileType asciidoc,changelog,context,gitcommit,NeogitCommit,NeogitCommitMessage,lsp_markdown,mail,markdown,rst,rtf,texinfo,text,txt setlocal spell
    autocmd FileType gitcommit,NeogitCommit,NeogitCommitMessage setlocal wrap textwidth=80

    autocmd Filetype man setlocal nowrap

  augroup end

  " )))

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

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

  " " Autocommand for disabling undofile in /tmp on non-windows systems (((
  "
  " if !has('win32') || !has('win64')
  "   augroup disableTempUndo
  "   autocmd!
  "   autocmd BufWritePre /tmp/* setlocal noundofile
  "   augroup END
  " endif
  "
  " " )))

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

  " " Autocommands for LaTeX filetype (((
  "
  " augroup LaTeXSettings
  "   autocmd!
  "   autocmd FileType tex setlocal foldcolumn=auto:7
  "   " autocmd InsertCharPre *.tex set conceallevel=0
  "   " autocmd InsertLeave *.tex set conceallevel=2
  " augroup END
  "
  " )))

  " augroup FtLuaSettings
  "   autocmd!
  "   autocmd FileType lua setlocal foldcolumn=auto:7
  " augroup END



    " Autocommand for opening the quickfix window (((

    augroup my_quickfix
    autocmd!
    " autocmd QuickFixCmdPost cexpr cwindow
    autocmd QuickFixCmdPost [^l]* nested copen
    " autocmd QuickFixCmdPost l* nested lopen
    " https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
    " autocmd QuickFixCmdPost cgetexpr cwindow
    augroup END

    " )))

  ]]

  -- )))

  -- Set up custom filetypes (lua-based config) (((

  local function yaml_ft(path, bufnr)
    -- get content of buffer as string
    local content = vim.filetype.getlines(bufnr)
    if type(content) == "table" then content = table.concat(content, "\n") end

    -- check if file is in roles, tasks, or handlers folder
    local path_regex = vim.regex "(tasks\\|roles\\|handlers)/"
    if path_regex and path_regex:match_str(path) then return "yaml.ansible" end
    -- check for known ansible playbook text and if found, return yaml.ansible
    local regex = vim.regex "hosts:\\|tasks:"
    if regex and regex:match_str(content) then return "yaml.ansible" end

    -- return yaml if nothing else
    return "yaml"
  end

  -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/filetype.lua
  vim.filetype.add {
    extension = {
      cl = "opencl",
      frag = "glsl",
      fs = "glsl",
      geom = "glsl",
      gs = "glsl",
      -- make = "make",
      pd_lua = "lua",
      pd_luax = "lua",
      qmd = "markdown",
      vert = "glsl",
      vs = "glsl",
      jl = "julia",
      yml = yaml_ft,
      yaml = yaml_ft,
    },
    filename = {
      ["/etc/mkinitcpio.conf"] = "confini",
      ["/etc/environment"] = "confini",
      [".dace.conf"] = "yaml",
      ["zuliprc"] = "dosini",
      ["devcontainer.json"] = "jsonc",
      ["tasks.json"] = "jsonc",
      ["launch.json"] = "jsonc",
    },
    pattern = {
      ["/tmp/neomutt.*"] = "markdown",
      -- [vim.env.XDG_CONFIG_HOME .. "/udev/rules.d/.*%.rules"] = "udevrules",
    },
  }

  -- )))
end
