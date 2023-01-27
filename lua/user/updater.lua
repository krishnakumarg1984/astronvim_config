-- Configure AstroNvim updates. Returns the 'updater' table
return {
  channel = "nightly", -- "stable" or "nightly"
  -- channel = "stable", -- "stable" or "nightly"

  -- branch = "nightly", -- branch name (NIGHTLY ONLY)
  branch = "v3", -- branch name (NIGHTLY ONLY)

  skip_prompts = true, -- skip prompts about breaking changes
  show_changelog = true, -- show the changelog after performing an update
  auto_quit = false, -- automatically quit the current session after a successful update
}
