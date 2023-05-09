return {
  -- add custom handler
  rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
}
