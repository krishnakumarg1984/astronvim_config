if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    local function yaml_ft(_, bufnr)
      local buf_text = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n")
      if vim.regex("AWSTemplateFormatVersion:"):match_str(buf_text) then
        return "yaml.cfn"
      else -- return yaml if nothing else
        return "yaml"
      end
    end
    opts = require("astrocore").extend_tbl(opts, {
      autocmds = {
        auto_spell = {
          {
            event = "FileType",
            desc = "Enable wrap and spell for text like documents",
            pattern = { "gitcommit", "markdown", "markdown.*", "text", "plaintex" },
            callback = function()
              vim.opt_local.wrap = true
              vim.opt_local.spell = true
            end,
          },
        },
        autohide_tabline = {
          {
            event = "User",
            desc = "Auto hide tabline",
            pattern = "AstroBufsUpdated",
            callback = vim.schedule_wrap(function()
              local new_showtabline = #vim.t.bufs > 1 and 2 or 1
              if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
            end),
          },
        },
      },
      -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
      diagnostics = {
        update_in_insert = false,
        underline = true,
        virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
        virtual_lines = { current_line = true, severity = { min = vim.diagnostic.severity.WARN } },
      },
      -- Configure core features of AstroNvim
      features = {
        autopairs = true, -- enable autopairs at start
        cmp = true, -- enable completion at start
        diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
        highlighturl = true, -- highlight URLs at start
        large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
        notifications = true, -- enable notifications at start
      },
      -- passed to `vim.filetype.add`
      filetypes = {
        -- see `:h vim.filetype.add` for usage
        extension = {
          mdx = "markdown.mdx",
          nf = "nextflow",
          ["nf.test"] = "nextflow",
          qmd = "markdown",
          yaml = yaml_ft,
          yml = yaml_ft,
          j2 = "jinja",
          jinja2 = "jinja",
          jinja = "jinja",
        },
        filename = {
          ["docker-compose.yaml"] = "yaml.docker-compose",
          ["docker-compose.yml"] = "yaml.docker-compose",
        },
        pattern = {
          ["%.env%.[%w_.-]+"] = "sh",
          [".*%.pkr.*%.hcl"] = "hcl.packer",
          [".*/kitty/.+%.conf"] = "bash",
          ["/tmp/neomutt.*"] = "markdown",
          [".*/defaults/.*%.ya?ml"] = "yaml.ansible",
          [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
          [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
          [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
          [".*/playbook.*%.ya?ml"] = "yaml.ansible",
          [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
          [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
          [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
          [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
          [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
        },
      },
      -- Mappings can be configured through AstroCore as well.
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- disable a few AstroNvim default bindings (setting a mapping to false will disable it)
          ["<C-Q>"] = false,
          ["<C-S>"] = false,
          ["q:"] = ":",
          -- better buffer navigation
          ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          -- better search
          -- better increment/decrement
          ["-"] = { "<C-x>", desc = "Descrement number" },
          ["+"] = { "<C-a>", desc = "Increment number" },
          ["<Leader>n"] = { "<Cmd>enew<CR>", desc = "New File" },
          ["<Leader>N"] = { "<Cmd>tabnew<CR>", desc = "New Tab" },
          ["<Leader><CR>"] = { '<Esc>/<++><CR>"_c4l', desc = "Next Template" },
          ["<Leader>."] = { "<Cmd>cd %:p:h<CR>", desc = "Set CWD" },
          -- mappings seen under group name "Buffer"
          ["<Leader>bd"] = {
            function()
              require("astroui.status.heirline").buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Close buffer from tabline",
          },
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          -- ["<Leader>b"] = { desc = "Buffers" },
        },
        i = {
          ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
        },
        -- terminal mappings
        t = {
          ["<C-BS>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
        },
        x = {
          ["<C-S>"] = false,
          -- better increment/decrement
          ["+"] = { "g<C-a>", desc = "Increment number" },
          ["-"] = { "g<C-x>", desc = "Descrement number" },
        },
        ia = {
          mktmpl = { function() return "<++>" end, desc = "Insert <++>", expr = true },
          ldate = { function() return os.date "%Y/%m/%d %H:%M:%S -" end, desc = "Y/m/d H:M:S -", expr = true },
          ndate = { function() return os.date "%Y-%m-%d" end, desc = "Y-m-d", expr = true },
          xdate = { function() return os.date "%m/%d/%y" end, desc = "m/d/y", expr = true },
          fdate = { function() return os.date "%B %d, %Y" end, desc = "B d, Y", expr = true },
          Xdate = { function() return os.date "%H:%M" end, desc = "H:M", expr = true },
          Fdate = { function() return os.date "%H:%M:%S" end, desc = "H:M:S", expr = true },
        },
      },
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
          -- spellfile = vim.fn.expand "~/.config/nvim/spell/en.utf-8.add",
          -- thesaurus = vim.fn.expand "~/.config/nvim/spell/mthesaur.txt",
          -- wrap = true, -- soft wrap lines
          conceallevel = 1, -- enable conceal
          list = true, -- show whitespace characters
          listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
          number = true, -- sets vim.opt.number
          relativenumber = true, -- sets vim.opt.relativenumber
          showbreak = "↪ ",
          showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
          signcolumn = "yes", -- sets vim.opt.signcolumn to yes
          spell = false,
          splitkeep = "screen",
          swapfile = false,
          wrap = false,
        },
        g = { -- vim.g.<key>
          -- configure global vim variables (vim.g)
          -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
          -- This can be found in the `lua/lazy_setup.lua` file
        },
      },
      rooter = {
        ignore = { servers = { "julials" } },
        autochdir = true,
      },
      treesitter = {
        highlight = {
          disabled = { "csv", "tsv" },
        },
        indent = {
          disabled = { "yaml" },
        },
      },
      signs = {
        BqfSign = { text = " " .. require("astroui").get_icon "Selected", texthl = "BqfSign" },
      },
    } --[[@as AstroCoreOpts]]) --[[@as AstroCoreOpts]]

    local maps = opts.mappings
    ---@cast maps -nil

    -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    maps.n.n = { "'Nn'[v:searchforward].'zv'", expr = true, desc = "Next Search Result" }
    maps.x.n = { "'Nn'[v:searchforward]", expr = true, desc = "Next Search Result" }
    maps.o.n = { "'Nn'[v:searchforward]", expr = true, desc = "Next Search Result" }
    maps.n.N = { "'nN'[v:searchforward].'zv'", expr = true, desc = "Prev Search Result" }
    maps.x.N = { "'nN'[v:searchforward]", expr = true, desc = "Prev Search Result" }
    maps.o.N = { "'nN'[v:searchforward]", expr = true, desc = "Prev Search Result" }

    -- add line text object
    for lhs, rhs in pairs {
      il = { ":<C-u>normal! $v^<CR>", desc = "inside line" },
      al = { ":<C-u>normal! V<CR>", desc = "around line" },
    } do
      maps.o[lhs] = rhs
      maps.x[lhs] = rhs
    end

    -- add missing in between and around two character pairs
    for _, char in ipairs { "_", "-", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
      for lhs, rhs in pairs {
        ["i" .. char] = { (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char), desc = "inside " .. char },
        ["a" .. char] = { (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char), desc = "around " .. char },
      } do
        maps.o[lhs] = rhs
        maps.x[lhs] = rhs
      end
    end

    return opts
  end,
}
