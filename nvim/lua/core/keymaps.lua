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
keymap.set("n", "<M-h>", "<C-w>h", opts)
keymap.set("n", "<M-j>", "<C-w>j", opts)
keymap.set("n", "<M-k>", "<C-w>k", opts)
keymap.set("n", "<M-l>", "<C-w>l", opts)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<C-M-Right>", "<C-w>v") -- split window vertically

keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<C-M-Down>", "<C-w>s") -- split window horizontally

keymap.set("n", "<leader>sx", ":bw<CR>") -- close current split window

keymap.set("n", "<C-n>", ":tabnew<CR>") -- open new tab
keymap.set("n", "<C-w>", ":tabclose<CR>") -- close tab
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Navigate buffers
keymap.set("n", "<C-Tab>", ":bnext<CR>", opts)
keymap.set("n", "<M-k>", ":bnext<CR>", opts)
keymap.set("n", "<M-j>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap.set("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap.set("t", "<M-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap.set("t", "<M-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap.set("t", "<M-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap.set("t", "<M-l>", "<C-\\><C-N><C-w>l", term_opts)

-- open terminal
keymap.set("n", "<leader>t", ":vsplit term://bash<CR>", opts)
keymap.set("n", "<leader>T", ":split term://bash<CR>", opts)
