-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2
return function(config)
  -- Define local variables (((

  local kind_icons = require("user.global_vars").kind_icons
  local cmp = require "cmp"
  -- https://github.com/hrsh7th/nvim-cmp/issues/980
  local ELLIPSIS_CHAR = "…"
  local MAX_LABEL_WIDTH = 25
  local MIN_LABEL_WIDTH = 25
  -- https://www.reddit.com/r/neovim/comments/unlj8d/is_there_any_way_to_show_types_in_nvimcmp/?sort=new
  local MIN_MENU_DETAIL_WIDTH = 15
  local MAX_MENU_DETAIL_WIDTH = 15

  -- )))

  return vim.tbl_deep_extend("force", config, {
    experimental = {
      ghost_text = true,
    },
    view = {
      entries = { name = "custom", selection_order = "near_cursor" },
    },
    window = {
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
      },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. strings[1] .. " "
        kind.menu = "    (" .. strings[2] .. ")"

        return kind
      end,
    },
    -- formatting = {
    --   fields = { "kind", "abbr", "menu" },
    --   format = function(entry, vim_item) -- (((
    --     -- Kind icons
    --     vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
    --     -- https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-1844480
    --     local label = vim_item.abbr
    --     local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
    --     if truncated_label ~= label then
    --       vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
    --     elseif string.len(label) < MIN_LABEL_WIDTH then
    --       local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
    --       vim_item.abbr = label .. padding
    --     end
    --     -- vim_item.abbr = string.sub(vim_item.abbr, 1, 25)
    --     -- Source
    --     local item = entry:get_completion_item()
    --     if item.detail then
    --       vim_item.menu = item.detail
    --     else
    --       vim_item.menu = ({
    --         buffer = "[Buf]",
    --         -- cmp_tabnine = "[Tabnine]",
    --         dictionary = "[Dictionary]",
    --         nvim_lsp_signature_help = "[Function Signature]",
    --         signature_help = "[Function Signature]",
    --         emoji = "[Emoji]",
    --         latex_symbols = "[LaTeX]",
    --         look = "[Dict]",
    --         git = "[Git]",
    --         luasnip = "[Snippet]",
    --         nvim_lsp = "[LSP]",
    --         nvim_lua = "[Nvim_Lua]",
    --         path = "[Path]",
    --         spell = "[Spell]",
    --         tags = "[Tags]",
    --         tmux = "[Tmux]",
    --       })[entry.source.name]
    --     end
    --     local my_menu = vim_item.menu
    --     local truncated_my_menu = vim.fn.strcharpart(my_menu, 0, MAX_MENU_DETAIL_WIDTH)
    --     if truncated_my_menu ~= my_menu then
    --       vim_item.menu = truncated_my_menu .. ELLIPSIS_CHAR
    --     elseif string.len(my_menu) < MIN_MENU_DETAIL_WIDTH then
    --       local menu_padding = string.rep(" ", MIN_MENU_DETAIL_WIDTH - string.len(my_menu))
    --       vim_item.menu = my_menu .. menu_padding
    --     end
    --     return vim_item
    --   end, -- )))
    -- },
    mapping = {
      ["<C-j>"] = cmp.config.disable,
      ["<C-k>"] = cmp.config.disable,
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-d>"] = cmp.config.disable,
    },
  })
end

-- some notes on using the clangd_extensions custom sort (((
-- Yeah, to enable this you will probably need to not lazy load clangd_extensions and add that to your cmp setup override in plugins.cmp and then also modify the lazy loading to load cmp after clangd_extensions
-- You could probably add a change in your cmp setup to check for the existence of clangd_extensions and add the sorting table if it's available
-- And then keep the lazy loading for clangd_extensions and at the end of your config function add something like require("configs.cmp").config() to reconfigure cmp once clangd is loaded
-- But this is a pretty specific use case that would require a non 0 amount of lua knowledge
-- sorting = {
--   comparators = {
--     cmp.config.compare.offset,
--     cmp.config.compare.exact,
--     cmp.config.compare.recently_used,
--     require("clangd_extensions.cmp_scores"),
--     cmp.config.compare.kind,
--     cmp.config.compare.sort_text,
--     cmp.config.compare.length,
--     cmp.config.compare.order,
--   },
-- },
-- )))
