if vim.fn.executable "blacktex" == 1 then
  vim.keymap.set("n", "<leader>vB", "my<cmd>%! blacktex %<CR>`y", { desc = "Blacktex (strip comments)" })
  vim.keymap.set("n", "<leader>vb", "mz<cmd>%! blacktex --keep-comments %<CR>`z", { desc = "Blacktex (keep comments)" })
end
return {
  config = function()
    vim.cmd [[

    " let g:vimtex_indent_bib_enabled = 0 " if using latexindent.pl, can disable vimtex indenting of bibtex files

    let g:matchup_override_vimtex = 1
    let g:matchup_matchparen_deferred = 1

    " let g:vimtex_mappings_enabled = 0

    let g:vimtex_disable_recursive_main_file_detection = 1
    let g:vimtex_syntax_conceal_disable = 1  " This option allows to disable all conceal features at once.

    if executable('pplatex')
      let g:vimtex_quickfix_method='pplatex'
    endif

    function! MyCallback(msg)
      let l:m = matchlist(a:msg, '\vRun number (\d+) of rule ''(.*)''')
      if !empty(l:m)
      echomsg l:m[2] . ' (' . l:m[1] . ')'
      endif
    endfunction

    let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'hooks': [function('MyCallback')],
    \}
    " let g:vimtex_compiler_latexmk = {'build_dir': {-> expand("%:t:r")}}

    if executable('bibparse')
      let g:vimtex_parser_bib_backend = 'bibparse'
    endif

    let g:vimtex_complete_bib = { 'simple': 1 }
    let g:vimtex_doc_handlers = ['vimtex#doc#handlers#texdoc']
    let g:vimtex_env_change_autofill = 1
    " let g:vimtex_include_search_enabled = 0

    " let g:vimtex_fold_enabled = 0  " Use this option to enable folding. (disabled by default)
    let g:vimtex_fold_bib_enabled = 1

    let g:vimtex_grammar_textidote = {
      \ 'jar': '$HOME/bin/textidote.jar',
      \ 'args': '',
    \}

    " let g:vimtex_matchparen_enabled = 0
    let g:vimtex_quickfix_autoclose_after_keystrokes = 2
    let g:vimtex_subfile_start_local = 1  " This option allows to specify that one should start with the local file for subfile'd documents instead of the main project file.
    " let g:vimtex_view_use_temp_files = 1

    let g:vimtex_grammar_vlty = {'lt_directory': '$HOME/bin/languagetool'}

    augroup VimTeXSettings
      autocmd!
      autocmd FileType tex setlocal spelllang=en_gb
      autocmd QuickFixCmdPost lmake lwindow
      " if executable("blacktex")
      "   autocmd FileWritePost *.tex %!blacktex --keep-comments %
      " endif
    augroup END

    " if executable('sioyek')
    "   let g:vimtex_view_method = 'sioyek'
    if executable('zathura')
      let g:vimtex_view_method = 'zathura'
    endif

]]
  end,
  vim.keymap.set("x", "<leader>vV", "<plug>(vimtex-compile-selected)", { desc = "Compile selected" }),
  vim.keymap.set("n", "<leader>vi", "<plug>(vimtex-info)", { desc = "Info" }),
  vim.keymap.set("n", "<leader>vI", "<plug>(vimtex-info-full)", { desc = "Info (full)" }),
  vim.keymap.set("n", "<leader>vt", "<plug>(vimtex-toc-toggle)", { desc = "Toggle ToC" }),
  vim.keymap.set("n", "<leader>vT", "<plug>(vimtex-toc-open)", { desc = "Open ToC" }),
  vim.keymap.set("n", "<leader>vq", "<plug>(vimtex-log)", { desc = "Log" }),
  vim.keymap.set("n", "<leader>vp", "<plug>(vimtex-view)", { desc = "View PDF" }),
  vim.keymap.set("n", "<leader>vr", "<plug>(vimtex-reverse-search)", { desc = "Reverse search" }),
  vim.keymap.set("n", "<leader>vv", "<plug>(vimtex-compile)", { desc = "Compile" }),
  vim.keymap.set({ "n", "x" }, "<leader>vV", "<plug>(vimtex-compile-selected)", { desc = "Compile selected" }),
  vim.keymap.set("n", "<leader>vk", "<plug>(vimtex-stop)", { desc = "Stop" }),
  vim.keymap.set("n", "<leader>vK", "<plug>(vimtex-stop-all)", { desc = "Stop all" }),
  vim.keymap.set("n", "<leader>ve", "<plug>(vimtex-errors)", { desc = "Errors" }),
  vim.keymap.set("n", "<leader>vo", "<plug>(vimtex-compile-output)", { desc = "Compile output" }),
  vim.keymap.set("n", "<leader>vg", "<plug>(vimtex-status)", { desc = "Status" }),
  vim.keymap.set("n", "<leader>vG", "<plug>(vimtex-status-all)", { desc = "Status (all)" }),
  vim.keymap.set("n", "<leader>vc", "<plug>(vimtex-clean)", { desc = "Clean" }),
  vim.keymap.set("n", "<leader>vC", "<plug>(vimtex-clean-full)", { desc = "Clean full" }),
  vim.keymap.set("n", "<leader>vl", "<plug>(vimtex-imaps-list)", { desc = "Insert-mode mappings" }),
  vim.keymap.set("n", "<leader>vx", "<plug>(vimtex-reload)", { desc = "Reload" }),
  vim.keymap.set("n", "<leader>vX", "<plug>(vimtex-reload-state)", { desc = "Reload state" }),
  vim.keymap.set("n", "<leader>vm", "<plug>(vimtex-toggle-main)", { desc = "Toggle main tex file" }),
  vim.keymap.set("n", "<leader>va", "<plug>(vimtex-context-menu)", { desc = "Context menu" }),
  vim.keymap.set("n", "<leader>vd", "<plug>(vimtex-doc-package)", { desc = "Doc package" }),
}
