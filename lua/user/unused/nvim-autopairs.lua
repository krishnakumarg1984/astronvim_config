-- Rules for 'nvim-autopairs'
return {
  ---@diagnostic disable-next-line: unused-local
  add_rules = function(npairs)
    local Rule = require "nvim-autopairs.rule"
    -- npairs.clear_rules()

    return {
      Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
      end),
      Rule("( ", " )")
        :with_pair(function() return false end)
        :with_move(function(opts) return opts.prev_char:match ".%)" ~= nil end)
        :use_key ")",
      Rule("{ ", " }")
        :with_pair(function() return false end)
        :with_move(function(opts) return opts.prev_char:match ".%}" ~= nil end)
        :use_key "}",
      Rule("[ ", " ]")
        :with_pair(function() return false end)
        :with_move(function(opts) return opts.prev_char:match ".%]" ~= nil end)
        :use_key "]",
    }
  end,
}
