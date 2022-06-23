return function(config)
  local buttons = config.layout[4].val
  local new_file = buttons[4]
  new_file.opts.shortcut = new_file.opts.shortcut .. ", ESC, q"

  table.remove(buttons, 4)
  table.insert(buttons, 1, new_file)

  return config
end
