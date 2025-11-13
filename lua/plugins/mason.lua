if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "williamboman/mason.nvim",
  opts = {
    -- add new AstroNvim Mason registry
    registries = { "github:AstroNvim/mason-registry" },
  },
}
