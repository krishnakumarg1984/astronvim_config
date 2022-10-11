return {
  event = { "BufRead Cargo.toml" },
  config = function() require "user.plugins.crates_nvim.config" end,
}
