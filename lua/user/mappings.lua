-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- more in/all objects between 2 characters (((

-- https://code.mehalter.com/projects/68/files/master/mappings.lua
local map = vim.keymap.set
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "?" } do
  for _, mode in ipairs { "x", "o" } do
    map(mode, "i" .. char, (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char))
    map(mode, "a" .. char, (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char))
  end
end

-- )))

-- for MULTIPLE vim-modes, disable some unnecessary/confusing neovim-default mappings (((

vim.keymap.set({ "n", "i" }, "<f1>", "<Nop>")
vim.keymap.set({ "n", "x" }, "s", "<Nop>") -- Disable 's' as recommended by sandwich.vim help file
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

" Commented-out (((

" nnoremaps (((

" https://www.reddit.com/r/vim/comments/oyqkkd/comment/h7x83ce/?utm_source=share&utm_medium=web2x&context=3
" Basically, it makes '0' act like '^' on first press, and then like '0' on " second press.
" So if I press 0, I go back to indentation. If I press 0 " again, I go to the first column of the line.
" And if I continue pressing " zero, it switches between the first column and the first character.
" nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/?sort=old
" nnoremap g. /\V\C<C-r>"<CR>cgn<C-a><Esc>
" nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>

" nmap cg* *Ncgn

" )))

" Substitute word under cursor and dot repeat (((

" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" nnoremap <silent> \\C :let @/='\<'.expand('<cword>').'\>'<CR>cgn
" nnoremap <leader><leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
" xnoremap <silent> \\C "sy:let @/=@s<CR>cgn

" )))

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
    ["<c-c>"] = { "<ESC>" }, -- CTRL-C does not trigger the InsertLeave autocmd. Map to <ESC>
  },

  -- )))

  -- normal mode keymaps (((

  n = {
    ["'"] = { "`" },
    ["<C-]>"] = { "g<C-]>" }, -- show options if tag has multiple
    ["<C-q"] = false,
    ["<C-s"] = false,
    ["<c-w>%"] = { "<c-w>t<c-w>H", desc = "Change split to vertical" }, -- change a horizontal split to vertical
    ['<c-w>"'] = { "<c-w>t<c-w>K", desc = "Change split to horizontal" }, -- change a vertical split to horizontal
    ["<C-w>f"] = { "<C-w>vgf", desc = "Open in vertical split" }, -- is a more generic mode remap
    ["<C-w>z"] = { "<C-w>|<C-w>_", desc = "Maximize screen" }, -- zoom full-screen by maximising the screen height and width
    ["<leader>*"] = { ":%s/<<c-r><c-w>>//g<left><left>", desc = "Replace cursor word" },
    ["<leader>q"] = false,
    ["<leader>w"] = false,
    ["<S-h>"] = false,
    -- ["<S-j>"] = { "mzJ`zmz" },
    ["<S-j>"] = { "mzJ`z" },
    ["<S-l>"] = false,
    ["<Space>"] = { "za" },
    ["{"] = false,
    ["}"] = false,
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    -- "bufferline.nvim" keymaps (((

    ["[b"] = { "<Cmd>BufferLineCyclePrev<CR>", silent = true, desc = "Prev Buffer" },
    ["]b"] = { "<Cmd>BufferLineCycleNext<CR>", silent = true, desc = "Next Buffer" },

    -- )))

    -- 'gitsigns' keymaps (((

    ["]c"] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", expr = true, desc = "Next diff" },
    ["[c"] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", expr = true, desc = "Prev diff" },

    -- )))

    -- 'smart-splits' keymaps (((
    ["<A-h>"] = {
      function() require("smart-splits").resize_left() end,
    },
    ["<A-j>"] = {
      function() require("smart-splits").resize_down() end,
    },
    ["<A-k>"] = {
      function() require("smart-splits").resize_up() end,
    },
    ["<A-l>"] = {
      function() require("smart-splits").resize_right() end,
    },
    -- )))

    -- 'SnipRun' mappings (((

    ["<leader>r"] = { "<Plug>SnipRunOperator" },
    ["<leader>rr"] = { "<Plug>SnipRun" },
    ["<leader>rc"] = { "<Plug>SnipClose" },
    ["<leader>rI"] = { "<Plug>SnipInfo" },

    -- )))

    --- mg979/tasks.vim keymaps (vimscript-based) (((

    ["<F2>"] = { "<Plug>(Tasks-Choose)" },
    ["<S-F2>"] = { "<Plug>(Tasks-Choose!)" },
    ["<F3>"] = { "<Plug>(Tasks-Profile)" },

    -- )))
  },

  -- )))

  -- operator-pending mode keymaps (((

  -- 'gitsigns' keymaps (((

  o = {
    ["ih"] = { ":<C-U>Gitsigns select_hunk<CR>" },
  },

  -- )))

  -- )))

  -- terminal mode mappings (((

  t = {
    ["<esc>"] = { "<C-\\><C-n>", silent = true },
    ["jk"] = false,
    ["<c-j>"] = false,
    ["<c-k>"] = false,
  },

  -- )))

  -- visual mode keymaps (((

  v = {
    ["*"] = { "y/\\V<C-R>=escape(@\",'/')<CR><CR>" },
    ["cg*"] = { "\"ay/\\V<C-R>=escape(@a,'/')<CR><CR>N\"_cgn" },
    -- https://www.reddit.com/r/neovim/comments/ttwzge/magic_replace_selected_text_mapping_with_repeat/
    ["y"] = { "myy`ymy" },
    ["Y"] = { "myY`ymy" },
    -- SnipRun mappings (((
    ["<leader>r"] = { "<Plug>SnipRun", desc = "Sniprun" },
    -- )))
  },

  -- )))

  -- visual-block mode keymaps (((

  x = {
    ["<"] = { "<gv" }, -- Stay in indent mode in visual-block mode
    [">"] = { ">gv" }, -- Stay in indent mode in visual-block mode

    -- 'gitsigns' keymaps (((

    ["ih"] = { "<Cmd><C-U>Gitsigns select_hunk<CR>" },

    -- )))
  },

  -- )))
}
