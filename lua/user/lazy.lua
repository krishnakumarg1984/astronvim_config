return {
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    -- notify = true, -- get a notification when new updates are found
    notify = false,
    frequency = 3600 * 3, -- check for updates every x hour(s)
  },
  diff = { cmd = "terminal_git" },
}
