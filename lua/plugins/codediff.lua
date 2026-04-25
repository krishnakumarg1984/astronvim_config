if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local function get_default_branch()
  for _, origin in ipairs { "origin/main", "origin/master" } do
    if require("astrocore").cmd({ "git", "rev-parse", "--verify", origin }, false) then return origin end
  end
  vim.notify("Unable to identify an origin branch", vim.log.levels.WARN)
end

local prefix = "<Leader>D"
return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  opts = {
    explorer = {
      view_mode = "tree",
    },
    diff = {
      hide_merge_artifacts = true,
    },
    keymaps = {
      view = {
        next_hunk = "]C",
        prev_hunk = "[C",
        next_file = "]D",
        prev_file = "[D",
        diff_get = prefix .. "o",
        diff_put = prefix .. "p",
        accept_current = prefix .. "o",
      },
      conflict = {
        accept_incoming = prefix .. "t",
        accept_current = prefix .. "o",
        accept_both = prefix .. "a",
        discard = prefix .. "b",
        next_conflict = "]C",
        prev_conflict = "[C",
        diffget_incoming = prefix .. "T",
        diffget_current = prefix .. "O",
      },
    },
  },
  specs = {
    {
      "NeogitOrg/neogit",
      optional = true,
      opts = {
        integrations = {
          codediff = true,
        },
        diff_viewer = "codediff",
      },
    },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [prefix] = { name = " Diff View" },
            [prefix .. "<CR>"] = { function() vim.cmd.CodeDiff() end, desc = "Open CodeDiff" },
            [prefix .. "h"] = { function() vim.cmd.CodeDiff("history", "%") end, desc = "Open DiffView File History" },
            [prefix .. "H"] = {
              function()
                local branch = get_default_branch()
                if branch then vim.cmd.CodeDiff("history", branch .. "..HEAD") end
              end,
              desc = "Open DiffView Branch History",
            },
            [prefix .. "o"] = {
              function()
                local branch = get_default_branch()
                if branch then vim.cmd.CodeDiff(branch) end
              end,
              desc = "Open CodeDiff against origin",
            },
          },
        },
      },
    },
  },
}
