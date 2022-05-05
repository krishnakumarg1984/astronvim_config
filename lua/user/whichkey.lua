-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  -- key_labels = {
  --   -- override the label used to display some keys. It doesn't effect WK in any other way.
  --   -- For example:
  --   -- ["<space>"] = "SPC",
  --   -- ["<cr>"] = "RET",
  --   -- ["<tab>"] = "TAB",
  -- },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  -- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  -- ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
  -- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  a = {
    name = "Code Outline",
    a = { "<cmd>AerialToggle!<cr>", "Toggle Outline" },
    c = { "<cmd>AerialClose<cr> | let g:aerial_open_automatic = 0<cr>", "Close Outline" },
    d = { "<cmd>AerialNextUp<cr>", "Next Symbol (up 1 level)" },
    n = { "<cmd>AerialNext<cr>", "Next Symbol" },
    o = { "<cmd>AerialOpen!<cr> | let g:aerial_open_automatic = 1<cr>", "Open Outline" },
    p = { "<cmd>AerialPrev<cr>", "Prev Symbol" },
    t = { "<cmd>AerialToggle!<cr>", "Toggle Outline" },
    u = { "<cmd>AerialPrevUp<cr>", "Prev Symbol (up 1 level)" },
  },
  ["b"] = {
    -- "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "<cmd>Telescope buffers<cr>",
    "Buffers",
  },
  -- ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  -- ["e"] = { "<cmd>NeoTreeRevealToggle<cr>", "Explorer" },
  -- ["E"] = { "<cmd>NeoTreeFocusToggle<cr>", "ExplorerFocus" },
  -- ["w"] = { "<cmd>w!<CR>", "Save" },
  -- ["q"] = { "<cmd>q!<CR>", "Quit" },
  -- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    -- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    -- "<cmd>lua require('telescope.builtin').find_files()<cr>",
    "<cmd>Telescope find_files<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    B = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commits" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
    f = { "<cmd>Telescope git_files<cr>", "Repo files" },
    -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    -- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    s = { "<cmd>Telescope git_status<cr>", "Git Status" },
    S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    T = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
  },

  L = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    -- q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

  -- T = {
  --   name = "Terminal",
  --   f = { "<cmd>ToggleTerm direction=float<cr>", "Toggle a floating terminal" },
  --   h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Toggle a horizontal terminal" },
  --   -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
  --   -- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Toggle a python terminal" },
  --   t = { "<cmd>ToggleTerm direction=tab<cr>", "Toggle a terminal in tab" },
  --   -- T = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Toggle htop in floating terminal" },
  --   -- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
  --   v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Toggle a vertical terminal" },
  -- },

  t = {
    name = "Telescope Search",
    a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
    -- b = { "<cmd>Telescope builtin<cr>", "Builtins" },
    B = { "<cmd>Telescope current_buffer_tags<cr>", "Tags in Current Buffer" },
    c = { "<cmd>Telescope colorscheme<cr>", "Pick colorscheme" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    -- e = { "<cmd>Telescope symbols<cr>", "Unicode Emojis/Icons/Symbols" },
    f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in Current Buffer" },
    F = { "<cmd>Telescope find_files<cr>", "Files in Project" },
    g = { "<cmd>Telescope grep_string<cr>", "Search String" },
    -- h = { "<cmd>Telescope help_tags<cr>", "Get Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlight Group" },
    j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Open Man Page" },
    M = { "<cmd>Telescope marks<cr>", "Marks" },
    o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    R = { "<cmd>Telescope resume<cr>", "Resume Last" },
    s = { "<cmd>Telescope aerial<cr>", "Outline (aerial) Symbols" },
    S = { "<cmd>Telescope treesitter<cr>", "Outline (treesitter) Symbols" },
    t = { "<cmd>Telescope tags<cr>", "Tags in Project" },
    T = { "<cmd>Telescope tagstack<cr>", "Tagstack" },
    v = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
    y = { "<cmd>Telescope filetypes<cr>", "Choose filetype" },
  },
}
local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
