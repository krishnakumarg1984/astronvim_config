require("cmp_git").setup {
  -- keep all other defaults, and just update the filetypes key as below to include NeogitCommitMessage
  filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
}
astronvim.add_user_cmp_source "git"
