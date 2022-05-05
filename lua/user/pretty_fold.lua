-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
  return
end

pretty_fold.setup {}
  keep_indentation = false,
  fill_char = "━",
  sections = {
    left = {
      "━ ",
      function()
        return string.rep("*", vim.v.foldlevel)
      end,
      " ━┫",
      "content",
      "┣",
    },
    right = {
      "┫ ",
      "number_of_folded_lines",
      ": ",
      "percentage",
      " ┣━━",
    },
  },
}

pretty_fold.ft_setup("cpp", {
  process_comment_signs = false,
  comment_signs = {
    "/**", -- C++ Doxygen comments
  },
  stop_words = {
    "%s%*", -- a space and star char
    "@brief%s*", -- '@brief' and any number of spaces after
    -- or in single pattern:
    -- '%*%s*@brief%s*', -- * -> any number of spaces -> @brief -> all spaces after
  },
})

-- local status_ok, pretty_fold_preview = pcall(require, "pretty-fold.preview")
-- if not status_ok then
--   return
-- end

require("pretty-fold.preview").setup {
  key = "l", -- choose 'h' or 'l' key
}

-- pretty_fold_preview.setup_keybinding("l")
