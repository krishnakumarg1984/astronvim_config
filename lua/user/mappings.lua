-- vim: ft=lua:foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

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
-- vim.keymap.set({ "n", "x" }, "s", "<Nop>") -- Disable 's' as recommended by sandwich.vim help file
vim.keymap.set({ "n", "x" }, "&", ":&&<CR>") -- Remap normal/visual '&' to preserve substitution flags

-- )))

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
    ["<leader>/"] = false,
    ["<leader>q"] = false,
    ["<leader>w"] = false,
    ["<F7>"] = false,
    ["<M-t>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    ["<S-h>"] = false,
    -- ["<S-j>"] = { "mzJ`zmz" },
    ["<S-j>"] = { "mzJ`z" },
    ["<S-l>"] = false,
    ["<Space>"] = { "za" },
    ["{"] = false,
    ["}"] = false,
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    -- "text-case" keymaps (((

    ["gaa"] = { "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", desc = "Convert to phrase_case" },
    ["gaf"] = { "<cmd>lua require('textcase').current_word('to_path_case')<CR>", desc = "Convert to path_case" },
    ["gas"] = { "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", desc = "Convert to snake_case" },
    ["gat"] = { "<cmd>lua require('textcase').current_word('to_title_case')<CR>", desc = "Convert to title_case" },
    ["gaz"] = { "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", desc = "Convert to dot_case" },

    -- )))

    -- "nabla.nvim" keymaps (((

    ["<leader>N"] = { "<cmd>lua require('nabla').popup()<CR>", desc = "Scientific preview" },

    -- )))

    -- "bufferline.nvim" keymaps (((

    ["[b"] = { "<Cmd>BufferLineCyclePrev<CR>", silent = true, desc = "Prev Buffer" },
    ["]b"] = { "<Cmd>BufferLineCycleNext<CR>", silent = true, desc = "Next Buffer" },

    -- )))

    -- -- 'gitsigns' keymaps (((

    -- ["]c"] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", expr = true, desc = "Next diff" },
    -- ["[c"] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", expr = true, desc = "Prev diff" },

    -- -- )))

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

    -- -- 'SnipRun' mappings (((
    --
    -- ["<leader>r"] = { "<Plug>SnipRunOperator" },
    -- ["<leader>rr"] = { "<Plug>SnipRun" },
    -- ["<leader>rc"] = { "<Plug>SnipClose" },
    -- ["<leader>rI"] = { "<Plug>SnipInfo" },
    --
    -- -- )))

    --- mg979/tasks.vim keymaps (vimscript-based) (((

    ["<F2>"] = { "<Plug>(Tasks-Choose)" },
    ["<S-F2>"] = { "<Plug>(Tasks-Choose!)" },
    ["<F3>"] = { "<Plug>(Tasks-Profile)" },

    -- )))

    -- "crates.nvim" keymaps (((

    ["<leader>Ct"] = { "<cmd>lua require('crates').toggle()<CR>", desc = "Toggle crates" },
    ["<leader>Cr"] = { "<cmd>lua require('crates').reload()<CR>", desc = "Reload crates" },
    ["<leader>Cv"] = { "<cmd>lua require('crates').show_versions_popup()<CR>", desc = "Show versions" },
    ["<leader>Cf"] = { "<cmd>lua require('crates').show_features_popup()<CR>", desc = "Show features" },
    ["<leader>Cd"] = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", desc = "Show dependencies" },
    ["<leader>Cu"] = { "<cmd>lua require('crates').update_crate()<CR>", desc = "Update crate" },
    ["<leader>Ca"] = { "<cmd>lua require('crates').update_all_crates()<CR>", desc = "Update all crates" },
    ["<leader>CU"] = { "<cmd>lua require('crates').upgrade_crate()<CR>", desc = "Upgrade crate" },
    ["<leader>CA"] = { "<cmd>lua require('crates').upgrade_all_crates()<CR>", desc = "Upgrade all crates" },
    ["<leader>CH"] = { "<cmd>lua require('crates').open_homepage()<CR>", desc = "Open crate homepage" },
    ["<leader>CR"] = { "<cmd>lua require('crates').open_repository()<CR>", desc = "Open crate repository" },
    ["<leader>CD"] = { "<cmd>lua require('crates').open_documentation()<CR>", desc = "Open crate documentation" },
    ["<leader>CC"] = { "<cmd>lua require('crates').open_crates_io()<CR>", desc = "Open in crates.io" },

    -- )))

    -- "VimTeX" keymaps (((

    ["<leader>vi"] = { "<plug>(vimtex-info)", silent = true, desc = "Info" },
    ["<leader>vI"] = { "<plug>(vimtex-info-full)", silent = true, desc = "Info (full)" },
    ["<leader>vt"] = { "<plug>(vimtex-toc-toggle)", silent = true, desc = "Toggle ToC" },
    ["<leader>vT"] = { "<plug>(vimtex-toc-open)", silent = true, desc = "Open ToC" },
    ["<leader>vq"] = { "<plug>(vimtex-log)", silent = true, desc = "Log" },
    ["<leader>vp"] = { "<plug>(vimtex-view)", silent = true, desc = "View PDF" },
    ["<leader>vr"] = { "<plug>(vimtex-reverse-search)", silent = true, desc = "Reverse search" },
    ["<leader>vv"] = { "<plug>(vimtex-compile)", silent = true, desc = "Compile" },
    ["<leader>vV"] = { "<plug>(vimtex-compile-selected)", silent = true, desc = "Compile selected" },
    ["<leader>vk"] = { "<plug>(vimtex-stop)", silent = true, desc = "Stop" },
    ["<leader>vK"] = { "<plug>(vimtex-stop-all)", silent = true, desc = "Stop all" },
    ["<leader>ve"] = { "<plug>(vimtex-errors)", silent = true, desc = "Errors" },
    ["<leader>vo"] = { "<plug>(vimtex-compile-output)", silent = true, desc = "Compile output" },
    ["<leader>vg"] = { "<plug>(vimtex-status)", silent = true, desc = "Status" },
    ["<leader>vG"] = { "<plug>(vimtex-status-all)", silent = true, desc = "Status (all)" },
    ["<leader>vc"] = { "<plug>(vimtex-clean)", silent = true, desc = "Clean" },
    ["<leader>vC"] = { "<plug>(vimtex-clean-full)", silent = true, desc = "Clean full" },
    ["<leader>vl"] = { "<plug>(vimtex-imaps-list)", silent = true, desc = "Insert-mode mappings" },
    ["<leader>vx"] = { "<plug>(vimtex-reload)", silent = true, desc = "Reload" },
    ["<leader>vX"] = { "<plug>(vimtex-reload-state)", silent = true, desc = "Reload state" },
    ["<leader>vm"] = { "<plug>(vimtex-toggle-main)", silent = true, desc = "Toggle main" },
    ["<leader>va"] = { "<plug>(vimtex-context-menu)", silent = true, desc = "Context menu" },
    ["<leader>vd"] = { "<plug>(vimtex-doc-package)", silent = true, desc = "Doc package" },

    -- )))
  },

  -- )))

  -- operator-pending mode keymaps (((

  o = {
    -- -- 'gitsigns' keymaps (((
    --
    -- o = {
    --   ["ih"] = { ":<C-U>Gitsigns select_hunk<CR>" },
    -- },
    --
    -- -- )))
    -- "text-case" keymaps (((

    ["gaa"] = { "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", desc = "Convert to phrase_case" },
    ["gaf"] = { "<cmd>lua require('textcase').current_word('to_path_case')<CR>", desc = "Convert to path_case" },
    ["gas"] = { "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", desc = "Convert to snake_case" },
    ["gat"] = { "<cmd>lua require('textcase').current_word('to_title_case')<CR>", desc = "Convert to title_case" },
    ["gaz"] = { "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", desc = "Convert to dot_case" },

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
    ["<c-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
  },

  -- )))

  -- visual mode keymaps (((

  v = {
    ["<leader>/"] = false,
    ["*"] = { "y/\\V<C-R>=escape(@\",'/')<CR><CR>" },
    ["cg*"] = { "\"ay/\\V<C-R>=escape(@a,'/')<CR><CR>N\"_cgn" },
    -- https://www.reddit.com/r/neovim/comments/ttwzge/magic_replace_selected_text_mapping_with_repeat/
    ["y"] = { "myy`ymy" },
    ["Y"] = { "myY`ymy" },
    -- SnipRun mappings (((
    ["<leader>r"] = { "<Plug>SnipRun", desc = "Sniprun" },
    -- )))
    -- "text-case" keymaps (((

    ["gaa"] = { "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", desc = "Convert to phrase_case" },
    ["gaf"] = { "<cmd>lua require('textcase').current_word('to_path_case')<CR>", desc = "Convert to path_case" },
    ["gas"] = { "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", desc = "Convert to snake_case" },
    ["gat"] = { "<cmd>lua require('textcase').current_word('to_title_case')<CR>", desc = "Convert to title_case" },
    ["gaz"] = { "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", desc = "Convert to dot_case" },

    -- )))
    -- "crates.nvim" keymaps (((

    ["<leader>Cu"] = { "<cmd>lua require('crates').update_crate()<CR>", desc = "Update crate" },
    ["<leader>CU"] = { "<cmd>lua require('crates').upgrade_crates()<CR>", desc = "Upgrade crates" },

    -- )))
  },

  -- )))

  -- visual-block mode keymaps (((

  x = {
    ["<"] = { "<gv" }, -- Stay in indent mode in visual-block mode
    [">"] = { ">gv" }, -- Stay in indent mode in visual-block mode

    -- "text-case" keymaps (((

    ["gaa"] = { "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", desc = "Convert to phrase_case" },
    ["gaf"] = { "<cmd>lua require('textcase').current_word('to_path_case')<CR>", desc = "Convert to path_case" },
    ["gas"] = { "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", desc = "Convert to snake_case" },
    ["gat"] = { "<cmd>lua require('textcase').current_word('to_title_case')<CR>", desc = "Convert to title_case" },
    ["gaz"] = { "<cmd>lua require('textcase').current_word('to_dot_case')<CR>", desc = "Convert to dot_case" },

    -- )))

    -- -- 'gitsigns' keymaps (((
    --
    -- ["ih"] = { "<Cmd><C-U>Gitsigns select_hunk<CR>" },
    --
    -- -- )))

    -- 'VimTeX' keymaps (((

    ["<leader>vV"] = { "<plug>(vimtex-compile-selected)", desc = "Compile selected" },

    -- )))
  },

  -- )))
}
