return {
  config = function()
    vim.cmd [[
  let g:vimtex_disable_recursive_main_file_detection = 1

  function! Callback(msg)
    let l:m = matchlist(a:msg, '\vRun number (\d+) of rule ''(.*)''')
    if !empty(l:m)
      echomsg l:m[2] . ' (' . l:m[1] . ')'
    endif
  endfunction

  let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : 'build',
  \ 'hooks': [function('Callback')],
  \ 'options' : [
  \   '-verbose',
  \   '-recorder',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ]
  \}
  " let g:vimtex_compiler_latexmk = {'build_dir': {-> expand("%:t:r")}}

  if executable('bibparse')
      let g:vimtex_parser_bib_backend = 'bibparse'
  endif

  let g:vimtex_complete_bib = { 'simple': 1 }
  let g:vimtex_doc_handlers = ['vimtex#doc#handlers#texdoc']
  let g:vimtex_env_change_autofill = 1
  " let g:vimtex_include_search_enabled = 0

  let g:vimtex_fold_bib_enabled = 1

  let g:vimtex_grammar_textidote = {
  \ 'jar': '$HOME/bin/textidote.jar',
  \ 'args': '',
  \}

  let g:vimtex_matchparen_enabled = 0
  let g:vimtex_quickfix_autoclose_after_keystrokes = 2
  let g:vimtex_subfile_start_local = 1
  " let g:vimtex_view_use_temp_files = 1

]]
  end,
}
