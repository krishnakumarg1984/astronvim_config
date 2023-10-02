return {
  after = "nvim-cmp",
  config = function() astronvim.add_user_cmp_source(require("user.cmp_sources").buffer_source) end,
}
