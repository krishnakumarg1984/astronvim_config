-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2
-- Last full review on: Nov 12, 2023

-- Autogroups & Autocommands (lua-based) (((

-- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/r/settings/autocmds.lua
local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opts = { clear = true }
local id = {}

-- formatoptions (((

aucmd("FileType", {
  group = augroup("FormatOptions", opts),
  callback = function()
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
  desc = "Custom formatoptions",
})

-- )))

-- highlightyank (((

aucmd("TextYankPost", {
  group = augroup("highlightyank", opts),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 650 }
  end,
  desc = "Highlight yanked text",
})

-- )))

-- autoread external changes (((

-- https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482
-- https://unix.stackexchange.com/a/383044
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
-- https://unix.stackexchange.com/a/760218
aucmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  group = augroup("AutoreadExternalChanges", opts),
  pattern = "*",
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
  desc = "Trigger autoread when file changes on disk",
})

-- )))

-- file changed alert (((

-- Notification after file change
aucmd({ "FileChangedShellPost" }, {
  group = augroup("FileChangedAlert", opts),
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
  desc = "Warn user about file changed on disk outside of neovim",
})

-- " )))

-- stop insert when focus is lost (((

-- https://www.reddit.com/r/neovim/comments/159bib0/comment/jtf40i4/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- Save all buffers when focus lost, ignoring warnings, and return to normal mode.
aucmd("FocusLost", {
  group = augroup("FocusLostStuff", opts),
  callback = function(ev)
    vim.cmd.stopinsert()
    vim.cmd.wall { mods = { silent = true } }
  end,
})

-- )))

-- enable spell for text like documents (((
aucmd("FileType", {
  desc = "Enable wrap and spell for text like documents",
  group = augroup("auto_spell", opts),
  pattern = {
    "asciidoc",
    "changelog",
    "context",
    "gitcommit",
    "help",
    "NeogitCommit",
    "NeogitCommitMessage",
    "lsp_markdown",
    "mail",
    "markdown",
    "rst",
    "rtf",
    "texinfo",
    "text",
    "txt",
    "plaintex",
  },
  callback = function()
    -- vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
-- )))

-- Auto create dir when saving a file where some intermediate directory does not exist (((

-- https://dev.to/voyeg3r/my-lazy-neovim-config-3h6o
aucmd("BufWritePre", {
  group = augroup("write_pre", opts),
  callback = function(event)
    if event.match:match "^%w%w+://" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- )))

-- highlight redundant spaces (except in insert mode) (((

-- https://dev.to/voyeg3r/my-lazy-neovim-config-3h6o
aucmd("InsertLeave", {
  group = augroup("MatchRedundantSpaces", opts),
  pattern = "*",
  callback = function()
    vim.cmd [[highlight RedundantSpaces ctermbg=red guibg=red]]
    vim.cmd [[match RedundantSpaces /\s\+$/]]
  end,
  desc = "Higlight extra spaces",
})

aucmd("InsertEnter", {
  group = augroup("clear_matches", opts),
  pattern = "*",
  callback = function()
    vim.cmd [[call clearmatches()]]
    vim.cmd [[highlight RedundantSpaces ctermbg=red guibg=red]]
  end,
  desc = "Do not show extra spaces during typing",
})

-- )))

-- )))

-- Autogroups & Autocommands (vimscript-based) (((

vim.cmd [[

  " _general_settings autogroup (((

  augroup _general_settings
    autocmd!

    " https://stackoverflow.com/questions/1832085/how-to-jump-to-the-next-tag-in-vim-help-file
    autocmd FileType help nnoremap <buffer> <leader>Tn /\|.\zs\S\{-}\|/<cr>zz

    " https://stackoverflow.com/questions/4687009/opening-help-in-a-full-window
    autocmd FileType help :tabnew % | tabprevious | quit | tabnext
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

  ]]

-- )))
