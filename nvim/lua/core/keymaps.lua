local opts = {
	noremap = true,
	silent = true,
}
local term_opts = {
	silent = true,
}
local keymap = vim.keymap

-- Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<cr>")
keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<cr>")
keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<cr>")
keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<cr>")

keymap.set("n", "<M-left>", "<cmd>TmuxNavigateLeft<cr>")
keymap.set("n", "<M-down>", "<cmd>TmuxNavigateDown<cr>")
keymap.set("n", "<M-up>", "<cmd>TmuxNavigateUp<cr>")
keymap.set("n", "<M-right>", "<cmd>TmuxNavigateRight<cr>")

-- Navigate buffers
keymap.set("", "<C-right>", ":bnext<CR>", opts)
keymap.set("", "<C-left>", ":bprevious<CR>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Resize with arrows
keymap.set("", "<C-S-Up>", ":resize -2<CR>", opts)
keymap.set("", "<C-S-Down>", ":resize +2<CR>", opts)
keymap.set("", "<C-S-Left>", ":vertical resize +2<CR>", opts)
keymap.set("", "<C-S-Right>", ":vertical resize -2<CR>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- copy to system clipboard
keymap.set("v", "<y>", '"+y', term_opts)
keymap.set("n", "<yy>", '"+yy', term_opts)
keymap.set("n", "<x>", '"+x', term_opts)

keymap.set("n", "<C-S-o>", ":%bd|e#|bd#")

-- save like my old habit
keymap.set("", "<C-s>", ":w<CR>")

-- remove highlight
keymap.set("", "<C-h>", ":noh<CR>")

-- delete word backwords
keymap.set("n", "dw", 'vb"_d')

-- go to end of line
keymap.set("n", "ww", "$")
keymap.set("n", "qq", "0")

-- window management
keymap.set("n", "ss", "<C-w>v") -- split window vertically
keymap.set("n", "sh", "<C-w>s") -- split window horizontally
keymap.set("n", "se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>") -- close current split window

keymap.set("n", "<C-n>", ":tabnew<CR>") -- open new tab
keymap.set("n", "to", ":tabnew<CR>") -- open new tab
keymap.set("n", "tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "tp", ":tabp<CR>") --  go to previous tab

-- Insert --
-- Press jk fast to enter
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("v", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap.set("v", "p", '"_dP', opts)

-- open terminal
keymap.set("n", "<leader>t", ":vsplit term://zsh<CR>", opts)
keymap.set("n", "<leader>T", ":split term://zsh<CR>", opts)
