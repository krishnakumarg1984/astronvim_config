return function(config)
  -- config.components.active[2][6] = { provider = { name = "position", opts = { padding = true } } }
  config.components.active[2][6] = { provider = { name = "position", opts = { padding = { line = 4, col = 2 } } } }
  -- vim.pretty_print(config.components.active[2])
  return config
end
