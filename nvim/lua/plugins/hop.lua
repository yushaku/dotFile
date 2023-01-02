require("hop").setup()

vim.keymap.set("n", "tt", "<CMD>HopWordAC<CR>")
vim.keymap.set("n", "tr", "<CMD>HopWordBC<CR>")
vim.keymap.set("n", "tw", "<CMD>HopChar2<CR>")
vim.keymap.set("n", "tp", "<CMD>HopPattern<CR>")
vim.keymap.set("n", "tl", "<CMD>HopLineStart<CR>")
