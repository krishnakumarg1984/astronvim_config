return {
  -- ft = { "c", "cpp", "cuda", "cmake", "fortran" },
  requires = { "mfussenegger/nvim-dap" },
  config = function() require("cmake").setup {} end,
}
