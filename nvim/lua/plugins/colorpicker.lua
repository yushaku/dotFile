local opts = { noremap = true, silent = true }

vim.keymap.set("", "<leader>cp", "<cmd>CccPick<cr>", opts)
vim.keymap.set("n", "<leader>ct", "<cmd>CccHighlighterToggle<cr>", opts)

-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)
--
local status, colorPicker = pcall(require, "ccc")
if not status then
	return
end

colorPicker.setup()
