return function(config)
  config.display = nil -- no floating window for packer
  -- config.compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua"
  -- compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
  return config
end
