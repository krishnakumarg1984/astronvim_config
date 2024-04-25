-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "hrsh7th/nvim-cmp", -- A completion plugin for neovim coded in Lua.
  dependencies = {
    "hrsh7th/cmp-calc", -- nvim-cmp source for math calculation
    "hrsh7th/cmp-emoji", -- nvim-cmp source for emoji
    "jc-doyle/cmp-pandoc-references", -- A source for nvim-cmp, providing completion for bibliography, reference and cross-ref items in Pandoc/Markdown.
    "kdheepak/cmp-latex-symbols", -- Add latex symbol support for nvim-cmp.
  },
  opts = function(_, opts)
    opts.sources = {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "pandoc_references", priority = 725 },
      { name = "latex_symbols", priority = 700 },
      { name = "emoji", priority = 700 },
      { name = "calc", priority = 650 },
      { name = "path", priority = 500 },
      { name = "buffer", priority = 250, group_index = 2 },
    }

    if not opts.sorting then opts.sorting = {} end
    local compare = require "cmp.config.compare"
    opts.sorting.comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    }
  end,
}
