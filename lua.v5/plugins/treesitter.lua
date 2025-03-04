-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter", -- Nvim Treesitter configurations and abstraction layer
  dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true } },
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    -- opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
    --   "vim",
    --   -- add more arguments for adding more treesitter parsers
    -- })
    opts.query_linter = -- https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/sim_config/tree-sitter.lua
      {
        enable = true, -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/r/settings/treesitter.lua
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      }
    opts.indent = {
      disable = { "help", "latex", "python", "yaml", "org" },
    }
    opts.incremental_selection.keymaps = {
      init_selection = "<Leader>ss",
      node_incremental = "<Leader>si",
      node_decremental = "<Leader>sd",
      scope_incremental = "<Leader>sc",
    }
    opts.textobjects.select.keymaps = {
      ["in"] = { query = "@assignment.inner", desc = "inside assignment" },
      ["an"] = { query = "@assignment.outer", desc = "around assignment" },
      ["L"] = { query = "@assignment.lhs", desc = "lhs of assignment" },
      ["R"] = { query = "@assignment.rhs", desc = "rhs of assignment" },
      ["iu"] = { query = "@attribute.inner", desc = "inside attribute" },
      ["au"] = { query = "@attribute.outer", desc = "around attribute" },
      ["ik"] = { query = "@block.inner", desc = "inside block" },
      ["ak"] = { query = "@block.outer", desc = "around block" },
      -- ["iK"] = { query = "@call.inner", desc = "inside call" },
      -- ["aK"] = { query = "@call.outer", desc = "around call" },
      -- ["ic"] = { query = "@class.inner", desc = "inside class" },
      -- ["ac"] = { query = "@class.outer", desc = "around class" },
      ["ie"] = { query = "@comment.inner", desc = "inside comment" },
      ["ae"] = { query = "@comment.outer", desc = "around comment" },
      ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
      ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
      -- ["iF"] = { query = "@frame.inner", desc = "inside frame " },
      -- ["aF"] = { query = "@frame.outer", desc = "around frame " },
      ["if"] = { query = "@function.inner", desc = "inside function " },
      ["af"] = { query = "@function.outer", desc = "around function " },
      ["io"] = { query = "@loop.inner", desc = "inside loop" },
      ["ao"] = { query = "@loop.outer", desc = "around loop" },
      ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
      ["aa"] = { query = "@parameter.outer", desc = "around argument" },
      -- ["aS"] = { query = "@statement.outer", desc = "around statement" },
    }
    opts.textobjects.move.goto_next_start = {
      ["]n"] = { query = "@assignment.outer", desc = "Next assignment start" },
      ["]u"] = { query = "@attribute.outer", desc = "Next attribute start" },
      -- ["]k"] = { query = "@block.outer", desc = "Next block start" },
      -- ["]c"] = { query = "@class.outer", desc = "Next class start" },
      ["]e"] = { query = "@comment.outer", desc = "Next comment start" },
      ["]?"] = { query = "@conditional.outer", desc = "Next conditional start" },
      -- ["]f"] = { query = "@function.outer", desc = "Next function start" },
      ["]o"] = { query = "@loop.outer", desc = "Next loop start" },
      -- ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
    }
    opts.textobjects.move.goto_next_end = {
      ["]N"] = { query = "@assignment.outer", desc = "Next assignment end" },
      ["]U"] = { query = "@attribute.outer", desc = "Next attribute end" },
      -- ["]K"] = { query = "@block.outer", desc = "Next block end" },
      -- ["]C"] = { query = "@class.outer", desc = "Next class end" },
      ["]E"] = { query = "@comment.outer", desc = "Next comment end" },
      -- ["]?"] = { query = "@conditional.outer", desc = "Next conditional end" },
      -- ["]F"] = { query = "@function.outer", desc = "Next function end" },
      ["]O"] = { query = "@loop.outer", desc = "Next loop end" },
      -- ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
    }
    opts.textobjects.move.goto_previous_start = {
      ["[n"] = { query = "@assignment.outer", desc = "Previous assignment start" },
      ["[u"] = { query = "@attribute.outer", desc = "Previous attribute start" },
      -- ["[k"] = { query = "@block.outer", desc = "Previous block start" },
      -- ["[c"] = { query = "@class.outer", desc = "Previous class start" },
      ["[e"] = { query = "@comment.outer", desc = "Previous comment start" },
      ["[?"] = { query = "@conditional.outer", desc = "Previous conditional start" },
      -- ["[f"] = { query = "@function.outer", desc = "Previous function start" },
      ["[o"] = { query = "@loop.outer", desc = "Previous loop start" },
      -- ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
    }
    opts.textobjects.move.goto_previous_end = {
      ["[N"] = { query = "@assignment.outer", desc = "Previous assignment end" },
      ["[U"] = { query = "@attribute.outer", desc = "Previous attribute end" },
      -- ["[K"] = { query = "@block.outer", desc = "Previous block end" },
      -- ["[C"] = { query = "@class.outer", desc = "Previous class end" },
      ["[E"] = { query = "@comment.outer", desc = "Previous comment end" },
      -- ["[?"] = { query = "@conditional.outer", desc = "Previous conditional end" },
      -- ["[F"] = { query = "@function.outer", desc = "Previous function end" },
      ["[O"] = { query = "@loop.outer", desc = "Previous loop end" },
      -- ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
    }
    opts.textobjects.swap.swap_next = {
      [">N"] = { query = "@assignment.outer", desc = "Swap next assignment" },
      [">U"] = { query = "@attribute.outer", desc = "Swap next attribute" },
      -- [">K"] = { query = "@block.outer", desc = "Swap next block" },
      -- [">C"] = { query = "@class.outer", desc = "Swap next class" },
      [">E"] = { query = "@comment.outer", desc = "Swap next comment" },
      [">?"] = { query = "@conditional.outer", desc = "Swap next conditional" },
      -- [">F"] = { query = "@function.outer", desc = "Swap next function" },
      [">O"] = { query = "@loop.outer", desc = "Swap next loop" },
      -- [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
    }
    opts.textobjects.swap.swap_previous = {
      ["<N"] = { query = "@assignment.outer", desc = "Swap previous assignment" },
      ["<U"] = { query = "@attribute.outer", desc = "Swap previous attribute" },
      -- ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
      -- ["<C"] = { query = "@class.outer", desc = "Swap previous class" },
      ["<E"] = { query = "@comment.outer", desc = "Swap previous comment" },
      ["<?"] = { query = "@conditional.outer", desc = "Swap previous conditional" },
      -- ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
      ["<O"] = { query = "@loop.outer", desc = "Swap previous loop" },
      -- ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
    }
    -- opts.refactor = {
    --   highlight_definitions = {
    --     enable = true,
    --     clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~100.
    --   },
    --   -- highlight_current_scope = { enable = true },
    --   smart_rename = {
    --     enable = true,
    --     keymaps = {
    --       smart_rename = "gnr", -- in the absence of LSP , can use treesitter for smart renaming
    --     },
    --   },
    --   navigation = {
    --     enable = true,
    --     keymaps = {
    --       goto_definition = "grd",
    --       list_definitions = "gnD",
    --       list_definitions_toc = "gO",
    --       goto_next_usage = "<a-*>",
    --       goto_previous_usage = "<a-#>",
    --     },
    --   },
    -- }
  end,
}
