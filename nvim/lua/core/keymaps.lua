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

-- turn off highlight
keymap.set("n", "<C-n>", ":noh<CR>") -- open new tab

-- copy to system clipboard
keymap.set("v", "<y>", '"+y', term_opts)
keymap.set("n", "<yy>", '"+yy', term_opts)
keymap.set("n", "<x>", '"+x', term_opts)

-- save like my old habit
keymap.set({ "i", "n", "v" }, "<C-s>", "<esc>:w<CR>")

-- delete word backwords
keymap.set("n", "dw", 'vb"_d')

-- remap movement in file
keymap.set("n", "L", "g$")
keymap.set("n", "H", "g^")
keymap.set("n", "K", "O<ESC>")
keymap.set("n", "J", "o<ESC>")
keymap.set("n", "k", "gk")
keymap.set("n", "j", "gj")

-- select and copy faster
keymap.set("n", "vw", "viw")
keymap.set("n", "yw", "yiw")

-- window management
keymap.set("n", "ss", "<C-w>v") -- split window vertically
keymap.set("n", "sh", "<C-w>s") -- split window horizontally
keymap.set("n", "se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>") -- close current split window
keymap.set("n", "sd", ":bdelete!<CR>") -- close current buffer window

keymap.set("n", "to", ":tabnew<CR>") -- open new tab
keymap.set("n", "tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "tp", ":tabp<CR>") --  go to previous tab

-- Insert --
-- Press jk fast to enter
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", "JK", "<ESC>", opts)
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
keymap.set("n", "<leader>tv", ":vsplit term://zsh<CR>", opts)

-- ccc picker
keymap.set("", "<leader>cp", "<cmd>CccPick<cr>", opts)
keymap.set("n", "<leader>ct", "<cmd>CccHighlighterToggle<cr>", opts)

-- hop -- speed jump

keymap.set("n", "<leader>j", "<CMD>HopLineStartAC<CR>")
keymap.set("n", "<leader>k", "<CMD>HopLineStartBC<CR>")
keymap.set("n", "<leader>l", "<CMD>HopWordAC<CR>")
keymap.set("n", "<leader>h", "<CMD>HopWordBC<CR>")
keymap.set("n", "mw", "<CMD>HopChar2<CR>")
keymap.set("n", "mp", "<CMD>HopPattern<CR>")
keymap.set("n", "ml", "<CMD>HopLineStart<CR>")

-- winbar/statusline -- barbecue
keymap.set("n", "<leader>w", "<CMD>Barbecue toggle<CR>")
