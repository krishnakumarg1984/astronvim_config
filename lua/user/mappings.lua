-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Please use this mappings table to set keyboard mapping since this is the lower level configuration and more robust one.
-- 'which-key' will automatically pick-up stored data by this setting.

local wk = require "which-key"

wk.register({
  C = { name = "󱣘 Crates" },
  e = { name = " Explorer" },
  L = { name = " LC" },
  n = { name = " Annotate" },
  o = { name = " Overseer" },
  q = { name = " Quickfix" },
  x = { name = "󰒡 Diagnostics" },
  z = { name = "󰙨Testing" },
}, { mode = "n", prefix = "<leader>" })

-- for MULTIPLE vim-modes, disable some unnecessary/confusing neovim-default mappings (((

vim.keymap.set({ "n", "i" }, "<f1>", "<Nop>")
-- vim.keymap.set({ "n", "x" }, "s", "<Nop>") -- Disable 's' as recommended by sandwich.vim help file
vim.keymap.set({ "n", "x" }, "&", ":&&<CR>") -- Remap normal/visual '&' to preserve substitution flags

-- )))

-- vimscript mappings (((

vim.cmd [[

" cnoreabbrev mappings

" Replace :w with :up
cnoreabbrev <expr> w getcmdtype() == ":" && getcmdline() == 'w' ? 'up' : 'w'

" https://stackoverflow.com/questions/3131393/remapping-help-in-vim-to-open-in-a-new-tab
" cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
" cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
" cnoreabbrev <expr> helpgrep getcmdtype() == ":" && getcmdline() == 'helpgrep' ? 'tab helpgrep' : 'helpgrep'
cnoreabbrev <expr> Man getcmdtype() == ":" && getcmdline() == 'Man' ? 'tab Man' : 'Man'

"

" Make jump-selections work better in visual block mode

xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

"

]]

-- )))

-- the mappings lua table being returned (((

local utils = require "user.utils"
-- local astro_utils = require "astronvim.utils"

local mappings = {

  -- command-line mode keymaps (((

  c = {
    ["<c-n>"] = { "<down>" },
    ["<c-p>"] = { "<up>" },
  },

  -- )))

  -- insert mode keymaps (((

  i = {
    ["<c-c>"] = { "<ESC>" }, -- ctrl-c does not trigger InsertLeave event autocmd. Map to <ESC>
  },

  -- )))

  -- normal mode keymaps (((

  n = {
    -- disable certain remaps provided in base AstroNvim (((

    -- ["<leader>n"] = { name = "Annotate" },
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["<F7>"] = false, -- was remapped to toggling floating terminal, which is now set to <M-t>
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    ["<leader>/"] = false,
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    -- ["<leader>c"] = false,
    ["<leader>e"] = false,
    ["<leader>n"] = false,
    ["<leader>o"] = false,
    ["<leader>q"] = false,
    ["<leader>w"] = false,
    ["<S-h>"] = false,
    ["<S-l>"] = false,
    ["\\"] = false,
    ["{"] = false,
    ["|"] = false,
    ["}"] = false,

    -- )))

    -- normal mode keymaps for built-in neovim functionality/features (((

    ["'"] = { "`" },
    ["<C-]>"] = { "g<C-]>" }, -- show options if tag has multiple candidates
    ["<c-w>%"] = { "<c-w>t<c-w>H", desc = "Change split to vertical" }, -- change a horizontal split to vertical
    ['<c-w>"'] = { "<c-w>t<c-w>K", desc = "Change split to horizontal" }, -- change a vertical split to horizontal
    ["<C-w>f"] = { "<C-w>vgf", desc = "Open in vertical split" }, -- is a more generic mode remap
    ["<C-w>z"] = { "<C-w>|<C-w>_", desc = "Maximize screen" }, -- zoom full-screen by maximising the screen height and width
    ["<leader>*"] = { ":%s/<<c-r><c-w>>//g<left><left>", desc = "Replace cursor word" },
    -- ["<leader>D"] = { "<cmd>windo diffthis<CR>", desc = "Diff buffers" },
    -- ["<S-j>"] = { "mzJ`zmz" },
    ["<S-j>"] = { "mzJ`z" },
    ["<Space>"] = { "za" },
    ["n"] = { utils.better_search "n", desc = "Next search" }, -- better search
    ["N"] = { utils.better_search "N", desc = "Previous search" }, -- better search
    -- ["n"] = { "nzzzv" },
    -- ["N"] = { "Nzzzv" },

    -- )))

    -- bundled AstroNvim plugin keymaps for normal mode (((

    -- 'nvim-neo-tree/neo-tree.nvim' keymaps for normal mode (((

    ["<leader>ee"] = { "<cmd>Neotree action=show toggle=true<CR>", desc = "Toggle explorer" },
    ["<leader>eo"] = { "<cmd>Neotree action=show focus<CR>", desc = "Focus explorer" },

    -- )))

    -- 'mrjones2014/smart-splits.nvim' keymaps for normal mode (((

    ["<A-h>"] = {
      function()
        require("smart-splits").resize_left(2)
      end,
    },
    ["<A-j>"] = {
      function()
        require("smart-splits").resize_down(2)
      end,
    },
    ["<A-k>"] = {
      function()
        require("smart-splits").resize_up(2)
      end,
    },
    ["<A-l>"] = {
      function()
        require("smart-splits").resize_right(2)
      end,
    },

    -- )))

    -- 'akinsho/toggleterm.nvim' keymaps for normal mode (((

    ["<M-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal (float)" },
    ["<C-`>"] = { "<cmd>ToggleTerm direction=horizontal size=7<cr>", desc = "Toggle terminal (horizontal)" },
    ["<leader>g<s-u>"] = {
      function()
        astronvim.toggle_term_cmd "gitui"
      end,
      desc = "GitUI",
    },

    -- )))

    -- 'rebelot/heirline.nvim' mappings for normal mode (((

    -- ["<leader>bc"] = { function() astronvim.close_buf(0) end, desc = "Close buffer" },
    -- ["<leader>bC"] = { function() astronvim.close_buf(0, true) end, desc = "Force close buffer" },
    ["[b"] = {
      function()
        require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
      end,
      desc = "Prev buffer",
    },
    ["]b"] = {
      function()
        require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
      end,
      desc = "Next buffer",
    },

    -- )))

    -- 'stevearc/aerial.nvim' mappings for normal mode (((

    ["<leader>a"] = { name = " Symbol tree" },
    ["<leader>b"] = { name = " Buffers" },
    ["<leader>f"] = { name = " Find" },
    ["<leader>p"] = { name = " Packages" },
    -- ["<leader>lS"] = false,
    -- ["<leader>ln"] = { "<leader>ln", desc = "Toggle inline diagnostics" },
    ["<leader>aa"] = { "<cmd>AerialToggle!<cr>", desc = "Toggle outline" },
    ["<leader>aA"] = { "<cmd>AerialToggle<cr>", desc = "Toggle outline (focus)" },
    ["<leader>ac"] = { "<cmd>AerialClose<cr> | let g:aerial_open_automatic = 0<cr>", desc = "Close outline" },
    ["<leader>aC"] = { "<cmd>AerialTreeCloseAll<cr>", desc = "Collapse all" },
    ["<leader>an"] = { "<cmd>AerialNext<cr>", desc = "Next symbol" },
    ["<leader>aN"] = { "<cmd>AerialNextUp<cr>", desc = "Next symbol (up 1 level)" },
    ["<leader>ao"] = { "<cmd>AerialOpen!<cr> | let g:aerial_open_automatic = 1<cr>", desc = "Open outline" },
    ["<leader>aO"] = { "<cmd>AerialTreeOpenAll<cr>", desc = "Open all folds" },
    ["<leader>ap"] = { "<cmd>AerialPrev<cr>", desc = "Prev symbol" },
    ["<leader>aP"] = { "<cmd>AerialPrevUp<cr>", desc = "Prev symbol (up 1 level)" },
    ["<leader>as"] = { "<cmd>AerialTreeSyncFolds<cr>", desc = "Sync code folding" },
    ["<leader>at"] = { "<cmd>AerialToggle<cr>", desc = "Toggle outline & move cursor" },
    ["<leader>aT"] = { "<cmd>AerialTreeToggle!<cr>", desc = "Toggle folds at location" },

    -- )))

    -- 'lewis6991/gitsigns.nvim' mappings for normal mode (((

    ["<leader>gs"] = false, -- originally stage_hunk
    ["<leader>gh"] = false, -- originally reset_hunk

    -- )))

    -- )))
  },

  -- )))

  -- terminal mode mappings (((

  t = {
    -- ["<esc>"] = { "<C-\\><C-n>", silent = true },
    -- ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
    ["<F7>"] = false,
    ["<M-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    ["<C-`>"] = { "<cmd>ToggleTerm direction=horizontal size=7<cr>", desc = "Toggle terminal (horizontal)" },
    ["<C-h>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    ["<C-l>"] = false,
    ["<C-BS>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
  },

  -- )))

  -- visual mode keymaps (((

  v = {
    ["<leader>/"] = false,
    -- ["*"] = { "y/\\V<C-R>=escape(@\",'/')<CR><CR>" },
    -- ["cg*"] = { "\"ay/\\V<C-R>=escape(@a,'/')<CR><CR>N\"_cgn" },
    -- https://www.reddit.com/r/neovim/comments/ttwzge/magic_replace_selected_text_mapping_with_repeat/
    ["y"] = { "myy`ymy" },
    ["Y"] = { "myY`ymy" },
  },

  -- )))

  -- visual-block mode keymaps (((

  x = {
    ["<"] = { "<gv" }, -- Stay in indent mode in visual-block mode
    [">"] = { ">gv" }, -- Stay in indent mode in visual-block mode
  },

  -- )))

  -- operator-pending mode keymaps (((

  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },

  -- )))
}
return mappings

-- )))

-- Commented-out mappings (((

-- Commented-out vimscript mappings (((
--
-- " nnoremaps
--
-- " https://www.reddit.com/r/vim/comments/oyqkkd/comment/h7x83ce/?utm_source=share&utm_medium=web2x&context=3
-- " Basically, it makes '0' act like '^' on first press, and then like '0' on " second press.
-- " So if I press 0, I go back to indentation. If I press 0 " again, I go to the first column of the line.
-- " And if I continue pressing " zero, it switches between the first column and the first character.
-- " nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
--
-- " https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/?sort=old
-- " nnoremap g. /\V\C<C-r>"<CR>cgn<C-a><Esc>
-- " nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>
--
-- " nmap cg* *Ncgn
--
-- "
--
-- " Substitute word under cursor and dot repeat
--
-- " https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
-- " nnoremap <silent> \\C :let @/='\<'.expand('<cword>').'\>'<CR>cgn
-- " nnoremap <leader><leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
-- " xnoremap <silent> \\C "sy:let @/=@s<CR>cgn
--
--
-- )))

-- Commented-out lua mappings (((

-- local function show_documentation()
--   local filetype = vim.bo.filetype
--   if vim.tbl_contains({ "vim", "help" }, filetype) then
--     vim.cmd("h " .. vim.fn.expand "<cword>")
--   elseif vim.tbl_contains({ "man" }, filetype) then
--     vim.cmd("Man " .. vim.fn.expand "<cword>")
--   elseif vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
--     require("crates").show_popup()
--   else
--     vim.lsp.buf.hover()
--   end
-- end
--
-- vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })

-- )))

-- )))
