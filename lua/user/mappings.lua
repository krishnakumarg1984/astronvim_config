-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

-- add more text objects for "in" and "around" (((

-- https://code.mehalter.com/projects/68/files/master/mappings.lua
local map = vim.keymap.set
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    map(
      mode,
      "i" .. char,
      (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char),
      { desc = "between " .. char }
    )
    map(
      mode,
      "a" .. char,
      (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char),
      { desc = "around " .. char }
    )
  end
end

-- )))

-- for MULTIPLE vim-modes, disable some unnecessary/confusing neovim-default mappings (((

vim.keymap.set({ "n", "i" }, "<f1>", "<Nop>")
-- vim.keymap.set({ "n", "x" }, "s", "<Nop>") -- Disable 's' as recommended by sandwich.vim help file
vim.keymap.set({ "n", "x" }, "&", ":&&<CR>") -- Remap normal/visual '&' to preserve substitution flags

-- )))

-- vimscript mappings (((

vim.cmd [[

" cnoreabbrev mappings (((

" Replace :w with :up
cnoreabbrev <expr> w getcmdtype() == ":" && getcmdline() == 'w' ? 'up' : 'w'

" https://stackoverflow.com/questions/3131393/remapping-help-in-vim-to-open-in-a-new-tab
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
cnoreabbrev <expr> helpgrep getcmdtype() == ":" && getcmdline() == 'helpgrep' ? 'tab helpgrep' : 'helpgrep'
cnoreabbrev <expr> Man getcmdtype() == ":" && getcmdline() == 'Man' ? 'tab Man' : 'Man'

" )))

" Make jump-selections work better in visual block mode (((

xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

" )))

]]

-- )))

return {
  -- ""-mode mappings (((

  [""] = {
    ["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true },
    ["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true },
    ["<Down>"] = { "v:count == 0 ? 'gj' : 'j'", expr = true },
    ["<Up>"] = { "v:count == 0 ? 'gk' : 'k'", expr = true },
    ["<Space>"] = false,
  },

  -- )))

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

    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["<F7>"] = false, -- was remapped to toggling floating terminal, which is now set to <M-t>
    ["<leader>/"] = false,
    ["<leader>q"] = false,
    ["<leader>w"] = false,
    ["<S-h>"] = false,
    ["<S-l>"] = false,
    ["gl"] = false, -- disable AstroNvim's "Hover Diagnostics" keymap
    ["{"] = false,
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
    ["<leader>D"] = { "<cmd>windo diffthis<CR>", desc = "Diff buffers" },
    -- ["<S-j>"] = { "mzJ`zmz" },
    ["<S-j>"] = { "mzJ`z" },
    ["<Space>"] = { "za" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    -- )))

    -- bundled AstroNvim plugin keymaps for normal mode (((

    -- 'akinsho/bufferline.nvim' keymaps for normal mode (((

    ["[b"] = { "<Cmd>BufferLineCyclePrev<CR>", silent = true, desc = "Prev Buffer" },
    ["]b"] = { "<Cmd>BufferLineCycleNext<CR>", silent = true, desc = "Next Buffer" },

    -- )))

    -- 'nvim-neo-tree/neo-tree.nvim' keymaps for normal mode (((

    ["<leader>e"] = { "<cmd>Neotree action=show toggle=true<CR>", desc = "File explorer" },

    -- )))

    -- 'mrjones2014/smart-splits.nvim' keymaps for normal mode (((

    ["<A-h>"] = { function() require("smart-splits").resize_left() end },
    ["<A-j>"] = { function() require("smart-splits").resize_down() end },
    ["<A-k>"] = { function() require("smart-splits").resize_up() end },
    ["<A-l>"] = { function() require("smart-splits").resize_right() end },

    -- )))

    -- 'akinsho/toggleterm.nvim' keymaps for normal mode (((

    ["<M-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    ["<leader>g<s-u>"] = { function() astronvim.toggle_term_cmd "gitui" end, desc = "GitUI" },

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
    ["<C-h>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    ["<C-l>"] = false,
    ["<C-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
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
}

-- Commented-out mappings (((

-- Commented-out vimscript mappings (((
--
-- " nnoremaps (((
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
-- " )))
--
-- " Substitute word under cursor and dot repeat (((
--
-- " https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
-- " nnoremap <silent> \\C :let @/='\<'.expand('<cword>').'\>'<CR>cgn
-- " nnoremap <leader><leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
-- " xnoremap <silent> \\C "sy:let @/=@s<CR>cgn
--
-- " )))
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
