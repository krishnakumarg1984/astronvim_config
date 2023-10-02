require("project_nvim").setup {
  detection_methods = { "pattern" },
  patterns = { ".root", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
  silent_chdir = false,
}
require("telescope").load_extension "projects"
