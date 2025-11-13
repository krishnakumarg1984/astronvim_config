if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

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
        enable = true, -- https://gitlab.com/ranjithshegde/dotbare/-/blob/master/.config/nvim/lua/r/plugins/treesitter/settings.lua
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      }
    opts.indent = {
      disable = { "yaml" },
      -- disable = { "help", "latex", "python", "yaml", "org" },
    }
    opts.incremental_selection.keymaps = {
      init_selection = "<Leader>ss",
      node_incremental = "<Leader>si",
      node_decremental = "<Leader>sd",
      scope_incremental = "<Leader>sc",
    }
    opts.textobjects.select.keymaps = {
      -- ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
      -- ["aa"] = { query = "@parameter.outer", desc = "around argument" },
      -- ["ac"] = { query = "@class.outer", desc = "around class" },
      -- ["aF"] = { query = "@frame.outer", desc = "around frame " },
      -- ["af"] = { query = "@function.outer", desc = "around function " },
      -- ["ak"] = { query = "@block.outer", desc = "around block" },
      -- ["aK"] = { query = "@call.outer", desc = "around call" },
      -- ["ao"] = { query = "@loop.outer", desc = "around loop" },
      -- ["aS"] = { query = "@statement.outer", desc = "around statement" },
      -- ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
      -- ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
      -- ["ic"] = { query = "@class.inner", desc = "inside class" },
      -- ["iF"] = { query = "@frame.inner", desc = "inside frame " },
      -- ["if"] = { query = "@function.inner", desc = "inside function " },
      -- ["ik"] = { query = "@block.inner", desc = "inside block" },
      -- ["iK"] = { query = "@call.inner", desc = "inside call" },
      -- ["io"] = { query = "@loop.inner", desc = "inside loop" },
      ["ae"] = { query = "@comment.outer", desc = "around comment" },
      ["an"] = { query = "@assignment.outer", desc = "around assignment" },
      ["au"] = { query = "@attribute.outer", desc = "around attribute" },
      ["ie"] = { query = "@comment.inner", desc = "inside comment" },
      ["in"] = { query = "@assignment.inner", desc = "inside assignment" },
      ["iu"] = { query = "@attribute.inner", desc = "inside attribute" },
      ["L"] = { query = "@assignment.lhs", desc = "lhs of assignment" },
      ["R"] = { query = "@assignment.rhs", desc = "rhs of assignment" },
    }
    opts.textobjects.move.goto_next_start = {
      -- ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
      -- ["]f"] = { query = "@function.outer", desc = "Next function start" },
      -- ["]k"] = { query = "@block.outer", desc = "Next block start" },
      ["]?"] = { query = "@conditional.outer", desc = "Next conditional start" },
      ["]c"] = { query = "@class.outer", desc = "Next class start" },
      ["]e"] = { query = "@comment.outer", desc = "Next comment start" },
      ["]n"] = { query = "@assignment.outer", desc = "Next assignment start" },
      ["]o"] = { query = "@loop.outer", desc = "Next loop start" },
      ["]u"] = { query = "@attribute.outer", desc = "Next attribute start" },
    }
    opts.textobjects.move.goto_next_end = {
      -- ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
      -- ["]F"] = { query = "@function.outer", desc = "Next function end" },
      -- ["]K"] = { query = "@block.outer", desc = "Next block end" },
      ["]/"] = { query = "@conditional.outer", desc = "Next conditional end" },
      ["]C"] = { query = "@class.outer", desc = "Next class end" },
      ["]E"] = { query = "@comment.outer", desc = "Next comment end" },
      ["]N"] = { query = "@assignment.outer", desc = "Next assignment end" },
      ["]O"] = { query = "@loop.outer", desc = "Next loop end" },
      ["]U"] = { query = "@attribute.outer", desc = "Next attribute end" },
    }
    opts.textobjects.move.goto_previous_start = {
      -- ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
      -- ["[f"] = { query = "@function.outer", desc = "Previous function start" },
      -- ["[k"] = { query = "@block.outer", desc = "Previous block start" },
      ["[?"] = { query = "@conditional.outer", desc = "Previous conditional start" },
      ["[c"] = { query = "@class.outer", desc = "Previous class start" },
      ["[e"] = { query = "@comment.outer", desc = "Previous comment start" },
      ["[n"] = { query = "@assignment.outer", desc = "Previous assignment start" },
      ["[o"] = { query = "@loop.outer", desc = "Previous loop start" },
      ["[u"] = { query = "@attribute.outer", desc = "Previous attribute start" },
    }
    opts.textobjects.move.goto_previous_end = {
      -- ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
      -- ["[C"] = { query = "@class.outer", desc = "Previous class end" },
      -- ["[F"] = { query = "@function.outer", desc = "Previous function end" },
      -- ["[K"] = { query = "@block.outer", desc = "Previous block end" },
      ["[/"] = { query = "@conditional.outer", desc = "Previous conditional end" },
      ["[E"] = { query = "@comment.outer", desc = "Previous comment end" },
      ["[N"] = { query = "@assignment.outer", desc = "Previous assignment end" },
      ["[O"] = { query = "@loop.outer", desc = "Previous loop end" },
      ["[U"] = { query = "@attribute.outer", desc = "Previous attribute end" },
    }
    opts.textobjects.swap.swap_next = {
      -- [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
      -- [">C"] = { query = "@class.outer", desc = "Swap next class" },
      -- [">F"] = { query = "@function.outer", desc = "Swap next function" },
      -- [">K"] = { query = "@block.outer", desc = "Swap next block" },
      [">?"] = { query = "@conditional.outer", desc = "Swap next conditional" },
      [">E"] = { query = "@comment.outer", desc = "Swap next comment" },
      [">N"] = { query = "@assignment.outer", desc = "Swap next assignment" },
      [">O"] = { query = "@loop.outer", desc = "Swap next loop" },
      [">U"] = { query = "@attribute.outer", desc = "Swap next attribute" },
    }
    opts.textobjects.swap.swap_previous = {
      -- ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
      -- ["<C"] = { query = "@class.outer", desc = "Swap previous class" },
      -- ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
      -- ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
      ["<?"] = { query = "@conditional.outer", desc = "Swap previous conditional" },
      ["<E"] = { query = "@comment.outer", desc = "Swap previous comment" },
      ["<N"] = { query = "@assignment.outer", desc = "Swap previous assignment" },
      ["<O"] = { query = "@loop.outer", desc = "Swap previous loop" },
      ["<U"] = { query = "@attribute.outer", desc = "Swap previous attribute" },
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
