return {
  vim.cmd [[
  let g:cmake_build_dir_prefix = 'build/'
  let g:cmake_build_type = 'Debug'
  let g:cmake_compile_commands = 1 "generate compile commands data base if non-zero
  let g:cmake_compile_commands_link = '.'
  let g:cmake_reload_after_save = 1 " reload CMake project after saving CMake files
  let g:cmake_build_executor = 'term'
]],
}
