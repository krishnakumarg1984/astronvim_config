-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Autogroups & Autocommands (lua-based) (((

-- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/settings/autocmds.lua
local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- formatoptions (((

aucmd("FileType", {
  group = augroup("FormatOptions", { clear = true }),
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

aucmd("TextYankPost", {
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 650 }
  end,
  desc = "Highlight yanked text",
})

-- )))

-- file changed alert (((

-- https://vimhelp.org/vim_faq.txt.html
-- https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482
-- https://unix.stackexchange.com/a/383044
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
aucmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  group = augroup("AutoreadExternalChanges", { clear = true }),
  pattern = "*",
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
  desc = "Trigger autoread when file changes on disk",
})

-- )))

-- Autocommand to stop insert when focus is lost (((

-- https://github.com/airblade/dotvim/blob/master/vimrc
-- Save all buffers when focus lost, ignoring warnings, and return to normal mode.
aucmd("FocusLost", {
  group = augroup("FocusLostStuff", { clear = true }),
  callback = function(ev)
    vim.cmd.stopinsert()
    vim.cmd.wall { mods = { silent = true } }
  end,
})

-- )))

-- )))

-- Autogroups & Autocommands (vimscript-based) (((

vim.cmd [[

  " _general_settings autogroup (((

  augroup _general_settings
    autocmd!

    autocmd FileType qf,help,man,lspinfo,dap-float,neotest-summary nnoremap <silent> <buffer> q <cmd>close!<CR>

    " Press Enter to follow a help tag
    autocmd FileType help nnoremap <buffer><CR> <c-]>

    " Press Backspace to go back to the location of the previous tag
    autocmd FileType help nnoremap <buffer><BS> <c-T>

    " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
    autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

    autocmd FileType help setlocal number relativenumber
    autocmd FileType gitcommit,help,NeogitCommit,NeogitCommitMessage setlocal nolist

    " https://stackoverflow.com/questions/4687009/opening-help-in-a-full-window
    autocmd FileType help :tabnew % | tabprevious | quit | tabnext
    autocmd FileType help set buflisted number relativenumber

    autocmd FileType qf set nobuflisted

    autocmd FileType asciidoc,changelog,context,gitcommit,NeogitCommit,NeogitCommitMessage,lsp_markdown,mail,markdown,rst,rtf,texinfo,text,txt setlocal spell
    autocmd FileType gitcommit,NeogitCommit,NeogitCommitMessage setlocal wrap textwidth=80

    autocmd Filetype man setlocal nowrap

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

  " Autocommand for file changed alert (((

  " https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482/5
  augroup FileChangedAlert
    " Helps if you have to use another editor on the same file https://vimhelp.org/vim_faq.txt.html
    autocmd!
    autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  augroup END

  " )))

  ]]

-- )))
