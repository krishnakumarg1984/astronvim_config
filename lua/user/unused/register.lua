-- Modify which-key registration (use this with mappings table)
return {
  -- first key is the mode, n == normal mode
  n = {
    -- second key is the prefix, <leader> prefixes
    ["<leader>"] = {
      -- which-key registration table for normal mode, leader prefix
      a = { name = "Code outline" },
      c = { name = "CMake", t = { name = "CTest" } },
      C = { name = "Crates (Rust)" },
      e = { name = "Explorer" },
      -- f = { name = "File/Buffer" },
      l = { name = "Intellisense (LSP)" },
      n = { name = "Annotate" },
      q = { name = "Quickfix" },
      r = { name = "Rust/Cargo", b = { name = "Build" } },
      -- s = { name = "Search/Set" },
      -- T = { name = "Unit Tests" },
      t = {
        g = { function() astronvim.toggle_term_cmd "gitui" end, "GitUI" },
      },
      v = { name = "VimTeX" },
      x = { name = "Diagnostics" },
    },
    ["g"] = {
      a = { name = "Textcase plugin operations" },
    },
  },
  v = {
    ["leader"] = {
      v = { name = "VimTeX" },
    },
  },
}
