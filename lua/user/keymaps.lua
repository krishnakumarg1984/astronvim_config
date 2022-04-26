-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

-- Declare local variables (options and shortened names) (((

local opts_noremapsilent = { noremap = true, silent = true }
local opts_remapsilent = { noremap = false, silent = true }
local term_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap -- Shorten function name

-- )))

-- Comments and notes (((

-- Commented-out settings (((

-- keymap("", "<Space>", "<Nop>", opts_noremapsilent)  -- Remap space as leader key
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- )))

-- Modes (help/explanatory text): (((
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- )))

-- )))

-- Move across wrapped lines like regular lines (((

-- keymap("", "<Up>", "gk", opts_remapsilent)
-- keymap("", "<Down>", "gj", opts_remapsilent)
-- keymap("", "k", "gk", opts_remapsilent)
-- keymap("", "j", "gj", opts_remapsilent)

-- )))

-- Disable some mappings (((
-- As recommended by sandwich.vim help file (((
keymap("n", "s", "<Nop>", opts_remapsilent)
keymap("x", "s", "<Nop>", opts_remapsilent)
-- )))

keymap("n", "Q", "<Nop>", opts_noremapsilent) -- disables ex-mode
keymap("n", "<f1>", "<Nop>", opts_noremapsilent)

-- )))

-- Remap normal/visual & to preserve substitution flags (((
keymap("n", "&", ":&&<CR>", opts_noremapsilent)
keymap("x", "&", ":&&<CR>", opts_noremapsilent)
-- )))

-- Normal -- (((

-- keymap("n", "<leader>e", ":Lexplore 20<cr>", opts_noremapsilent)
keymap("n", "<C-w>f", "<C-w>vgf", opts_noremapsilent) -- is a more generic mode remap required?

keymap("n", "J", "mzJ`zmz", opts_noremapsilent)
keymap("n", "'", "`", opts_noremapsilent)
-- keymap("n", "Y", "y$", opts_noremapsilent) -- default since nvim 0.6

-- Navigate folds (((
-- keymap("n", "zf", "zMzvzz", opts_noremapsilent)
-- keymap("n", "zj", "zcjzOzz", opts_noremapsilent)
-- keymap("n", "zk", "zckzOzz", opts_noremapsilent)
keymap("n", "<Space>", "za", opts_noremapsilent)
-- )))

keymap("n", "<C-]>", "g<C-]>", opts_noremapsilent) -- show options if tag has multiple matches

-- Better window navigation (((

keymap("n", "<A-h>", "<C-w>h", opts_noremapsilent)
keymap("n", "<A-j>", "<C-w>j", opts_noremapsilent)
keymap("n", "<A-k>", "<C-w>k", opts_noremapsilent)
keymap("n", "<A-l>", "<C-w>l", opts_noremapsilent)

-- )))

-- )))

-- Insert -- (((
keymap("i", "<f1>", "<nop>", opts_noremapsilent)
keymap("i", "<c-c>", "<ESC>", opts_noremapsilent) -- CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
-- )))

-- Visual -- (((

-- Stay in indent mode in visual mode (((
keymap("v", "<", "<gv", opts_noremapsilent)
keymap("v", ">", ">gv", opts_noremapsilent)
-- )))

keymap("v", "y", "myy`ymy", opts_noremapsilent)
keymap("v", "Y", "myY`ymy", opts_noremapsilent)

-- -- Move text up and down (((
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts_noremapsilent)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts_noremapsilent)
-- keymap("v", "p", '"_dP', opts_noremapsilent)
-- -- )))

-- )))

-- Visual Block -- (((

-- Stay in indent mode in visual-block mode (((
keymap("x", "<", "<gv", opts_noremapsilent)
keymap("x", ">", ">gv", opts_noremapsilent)
-- )))

-- -- Move text up and down (((
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts_noremapsilent)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts_noremapsilent)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts_noremapsilent)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts_noremapsilent)
-- -- )))

-- )))

-- Command -- (((

keymap("c", "<c-n>", "<down>", opts_noremapsilent)
keymap("c", "<c-p>", "<up>", opts_noremapsilent)

-- )))

-- Terminal -- (((
-- Better terminal navigation

keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
-- keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", term_opts)

-- )))

-- -- Nvimtree (((
--
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts_noremapsilent)
--
-- -- )))

-- https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/?sort=old
-- nnoremap g. /\V\C<C-r>"<CR>cgn<C-a><Esc>
vim.cmd[[nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>]]
