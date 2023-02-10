-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Autogroups & Autocommands (lua-based) (((

-- formatoptions (((

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

-- )))

-- highlightyank (((

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "Search", timeout = 650 } end,
})

-- )))

-- autohidetabline (((

-- create an augroup to easily manage autocommands
vim.api.nvim_create_augroup("autohidetabline", { clear = true })
-- create a new autocmd on the "User" event
vim.api.nvim_create_autocmd("User", {
  desc = "Hide tabline when only one buffer and one tab", -- nice description
  -- triggered when vim.t.bufs is updated
  pattern = "AstroBufsUpdated", -- the pattern si the name of our User autocommand events
  -- group = "autohidetabline", -- add the autocmd to the newly created augroup
  group = vim.api.nvim_create_augroup("hidetabline", { clear = true }),
  callback = function()
    -- if there is more than one buffer in the tab, show the tabline
    -- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
    local new_showtabline = #vim.t.bufs > 1 and 2 or 1
    -- check if the new value is the same as the current value
    if new_showtabline ~= vim.opt.showtabline:get() then
      -- if it is different, then set the new `showtabline` value
      vim.opt.showtabline = new_showtabline
    end
  end,
})

-- )))

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
